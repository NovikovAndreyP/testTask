import { IsNotEmpty, IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class DateIntervalDto {

  constructor(start_date: string, end_date: string) {
    this.start_date = start_date;
    this.end_date = end_date;
  }

  @ApiProperty({default: '2021-11-10'})
  @IsString()
  @IsNotEmpty()
  start_date: string;

  @ApiProperty({default: '2021-11-14'})
  @IsString()
  @IsNotEmpty()
  end_date: string;
}