import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { BookingDto } from "./dto/booking.dto";
import { DbService } from "../db/db.service";
import { HotelRoomModelDto } from "../model/hotel-room-model.dto";
import { SaleModelDto } from "../model/sale-model.dto";
import { areIntervalsOverlapping, differenceInCalendarDays } from "date-fns";
import { DateIntervalDto } from "./dto/date-interval.dto";
import { BookingModelDto } from "../model/booking-model.dto";
import { ReportDto } from "./dto/report.dto";

@Injectable()
export class HotelRoomService {

  constructor(private readonly dbService: DbService) {
  }

  async getAll(): Promise<HotelRoomModelDto[]> {
    return this.dbService.executeQuery('SELECT * FROM hotel_room');
  }

  async book(bookingDto: BookingDto): Promise<BookingModelDto> {
    const days: number = differenceInCalendarDays(new Date(bookingDto.end_date), new Date(bookingDto.start_date));

    const saleModel: SaleModelDto = (await this.dbService.executeQuery(`SELECT * FROM sale WHERE days_count <= ${days} ORDER BY days_count DESC LIMIT 1`))[0];
    const sale: number = saleModel != undefined ? saleModel.sale : 0;

    const room: HotelRoomModelDto = (await this.dbService.executeQuery(`SELECT * FROM hotel_room WHERE id = ${bookingDto.hotel_room_id}`))[0];
    if (!room) {
      throw new HttpException({status: HttpStatus.FORBIDDEN, error: 'This room does not exist!'}, HttpStatus.FORBIDDEN);
    }
    if (!(await this.isRoomFree(room, new DateIntervalDto(bookingDto.start_date, bookingDto.end_date)))) {
      throw new HttpException({status: HttpStatus.FORBIDDEN, error: 'This room is already in use!'},
        HttpStatus.FORBIDDEN);
    }

    const price: number = days * room.price;
    const totalPrice: number = sale != undefined ? price * (1 - (sale / 100)) : price;

    return (await this.dbService.executeQuery(
      `INSERT INTO booking (hotel_room_id, start_date, end_date, price, sale, total_price) VALUES ` +
      `(${room.id}, '${bookingDto.start_date}', '${bookingDto.end_date}', ${price}, ${sale}, ${totalPrice}) ` +
      ` RETURNING id, start_date, end_date, price, sale, total_price`,
    ))[0];
  }

  async getFreeRooms(dateInterval: DateIntervalDto): Promise<Array<HotelRoomModelDto>> {
    const freeRooms: Array<HotelRoomModelDto> = Array<HotelRoomModelDto>();
    const rooms: Array<HotelRoomModelDto> = await this.dbService.executeQuery('SELECT * FROM hotel_room');
    for (const room of rooms) {
      if (await this.isRoomFree(room, dateInterval)) {
        freeRooms.push(room);
      }
    }
    return freeRooms;
  }

  async isRoomFree(room: HotelRoomModelDto, dateInterval: DateIntervalDto): Promise<boolean> {
    let bookingList: Array<BookingModelDto> =
      await this.dbService.executeQuery(`SELECT * FROM booking WHERE hotel_room_id = ${room.id}`);
    bookingList = bookingList.filter((booking: BookingModelDto) => {
      return  areIntervalsOverlapping(
        {start: new Date(booking.start_date), end: new Date(booking.end_date)},
        {start: new Date(dateInterval.start_date), end: new Date(dateInterval.end_date)},
        {inclusive: true});
    });
    if (bookingList.length != 0) {
      return false;
    } else {
      return true;
    }
  }

  async getHotelRoomReport(dateInterval: DateIntervalDto): Promise<ReportDto[]>{
    return this.dbService.executeQuery(`
    SELECT gst.year_month, avg(counter)
    FROM
      booking b 
      left JOIN LATERAL
       (SELECT 
       to_char(gs,'YYYY-MM') as year_month,
       count(gs) as counter 
       FROM generate_series(b.start_date, b.end_date, interval '1 day') gs 
        GROUP BY year_month
       ) gst ON TRUE
    WHERE start_date::date >= '${dateInterval.start_date}' AND start_date::date <= '${dateInterval.end_date}'
    group BY  gst.year_month ORDER BY gst.year_month`);
  }
}