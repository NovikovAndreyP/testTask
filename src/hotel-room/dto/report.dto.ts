import { ApiProperty } from "@nestjs/swagger";

export class ReportDto {

  @ApiProperty()
  year_month: string;

  @ApiProperty()
  average: number;
}