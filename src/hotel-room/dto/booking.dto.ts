import { ApiProperty } from "@nestjs/swagger";
import { IsInt, IsNotEmpty, IsString } from 'class-validator';
import { NotMondayOrThursday } from '../../validator-helpers/NotMondayOrThursday';
import { IsAfter } from "../../validator-helpers/isAfter";

export class BookingDto{
  @ApiProperty({default: 1})
  @IsInt()
  @IsNotEmpty()
  hotel_room_id: number;

  @ApiProperty({default: '2021-11-10'})
  @IsString()
  @IsNotEmpty()
  @NotMondayOrThursday({message: 'Start date must not be Monday or Thursday!'})
  start_date: string;

  @ApiProperty({default: '2021-11-14'})
  @IsString()
  @IsNotEmpty()
  @NotMondayOrThursday({message: 'End date must not be Monday or Thursday!'})
  @IsAfter('start_date', {message: 'Start date must be earlier than end date!'})
  end_date: string;
}