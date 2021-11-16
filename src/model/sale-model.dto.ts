import { ApiProperty } from '@nestjs/swagger';

export class SaleModelDto {

  @ApiProperty()
  id: number;

  @ApiProperty()
  daysCount: number;

  @ApiProperty()
  sale: number;
}