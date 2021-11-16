import { ApiProperty } from '@nestjs/swagger';

export class HotelRoomModelDto {

  @ApiProperty()
  id: number;

  @ApiProperty()
  name: string;

  @ApiProperty()
  price: number;
}