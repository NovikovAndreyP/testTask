import { Body, Controller, Get, Post } from '@nestjs/common';
import { HotelRoomService } from './hotel-room.service';
import { BookingDto } from './dto/booking.dto';
import { HotelRoomModelDto } from '../model/hotel-room-model.dto';
import { DateIntervalDto } from './dto/date-interval.dto';
import { ApiCreatedResponse } from "@nestjs/swagger";
import { BookingModelDto } from "../model/booking-model.dto";
import { ReportDto } from "./dto/report.dto";

@Controller('hotel-room')
export class HotelRoomController {

  constructor(private hotelService: HotelRoomService) {
  }

  @Get()
  @ApiCreatedResponse({
    type: [HotelRoomModelDto]
  })
  async getAll(): Promise<HotelRoomModelDto[]> {
    return this.hotelService.getAll();
  }

  @Post()
  @ApiCreatedResponse({
    type: BookingModelDto
  })
  async create(@Body() bookingDto: BookingDto): Promise<BookingModelDto> {
    return this.hotelService.book(bookingDto);
  }

  @Post('/free')
  @ApiCreatedResponse({
    type: [HotelRoomModelDto]
  })
  async getFreeRooms(@Body() dateInterval: DateIntervalDto): Promise<Array<HotelRoomModelDto>> {
    return this.hotelService.getFreeRooms(dateInterval);
  }

  @Post('/report')
  @ApiCreatedResponse({
    type: [ReportDto]
  })
  async getHotelRoomReport(@Body() dateInterval: DateIntervalDto): Promise<ReportDto[]>{
    return this.hotelService.getHotelRoomReport(dateInterval);
  }
}
