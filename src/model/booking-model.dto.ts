import { ApiProperty } from '@nestjs/swagger';

export class BookingModelDto {
  @ApiProperty()
  id: number;

  @ApiProperty()
  hotel_room_id: number;

  @ApiProperty()
  start_date: string;

  @ApiProperty()
  end_date: string;

  @ApiProperty()
  price: number;

  @ApiProperty()
  sale: number;

  @ApiProperty()
  total_price: number;
}