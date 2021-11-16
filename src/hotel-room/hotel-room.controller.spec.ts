import { Test, TestingModule } from "@nestjs/testing";
import { HotelRoomController } from "./hotel-room.controller";
import { HotelRoomService } from "./hotel-room.service";
import { BookingDto } from "./dto/booking.dto";
import { BookingModelDto } from "../model/booking-model.dto";
import { DateIntervalDto } from "./dto/date-interval.dto";

describe("HotelRoomController", () => {
  let controller: HotelRoomController;
  let service: HotelRoomService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HotelRoomController],
      providers: [
        {
          provide: HotelRoomService,
          useValue: {
            book: jest
              .fn()
              .mockImplementation((booking: BookingDto) => {
                Promise.resolve({
                  id: 1,
                  ...booking,
                  price: 1000,
                  sale: 0,
                  total_price: 1000
                });
              }),
            getAll: jest.fn().mockResolvedValue([
              {
                id: 1,
                name: "Test",
                price: 1000
              }
            ]),
            getFreeRooms: jest.fn().mockResolvedValue([
              {
                id: 1,
                name: "Test",
                price: 1000
              }
            ]),
            getHotelRoomReport: jest.fn().mockResolvedValue([
              {
                year_month: '2021-01',
                average: 10
              }
            ])
          }
        }
      ]
    }).compile();

    service = module.get<HotelRoomService>(HotelRoomService);
    controller = module.get<HotelRoomController>(HotelRoomController);
  });

  it("Get all hotel rooms", async () => {
    controller.getAll();
    expect(service.getAll).toHaveBeenCalled();
  });

  it("Book a hotel room", async () => {
    const testDto: BookingDto = {
      hotel_room_id: 1,
      start_date: "2000-09-29",
      end_date: "2000-10-03"
    };
    const result: BookingModelDto = {
      id: 1,
      hotel_room_id: 1,
      start_date: "2000-09-29",
      end_date: "2000-10-03",
      price: 1000,
      sale: 0,
      total_price: 1000
    };
    jest.spyOn(service, "book").mockImplementation(() => Promise.resolve(result));
    await expect(controller.create(testDto)).resolves.toBe(result);
  });

  it("", async () => {
    const testDto: DateIntervalDto = {
      start_date: "2000-09-29",
      end_date: "2000-10-03"
    };
    await controller.getFreeRooms(testDto);
    expect(service.getFreeRooms).toHaveBeenCalled();
  });

  it("Get all hotel rooms", async () => {
    const testDto: DateIntervalDto = {
      start_date: "2000-09-29",
      end_date: "2000-10-03"
    };
    await controller.getHotelRoomReport(testDto);
    expect(service.getHotelRoomReport).toHaveBeenCalled();
  });

});
