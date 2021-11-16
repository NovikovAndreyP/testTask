import { Module } from "@nestjs/common";
import { HotelRoomService } from "./hotel-room.service";
import { HotelRoomController } from "./hotel-room.controller";
import { DbModule } from "../db/db.module";

@Module({
  imports: [DbModule],
  controllers: [HotelRoomController],
  providers: [HotelRoomService]
})
export class HotelRoomModule{

}