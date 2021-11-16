import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { HotelRoomModule } from "./hotel-room/hotel-room.module";
import { ConfigModule } from "@nestjs/config";
import { DbModule } from './db/db.module';

@Module({
  imports: [
    HotelRoomModule,
    DbModule,
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: ['./.env'],
    })
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
