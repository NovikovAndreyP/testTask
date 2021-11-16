import {
  registerDecorator,
  ValidationArguments,
  ValidationOptions,
  ValidatorConstraint,
  ValidatorConstraintInterface
} from "class-validator";
import { isMonday, isThursday } from 'date-fns';

export function NotMondayOrThursday(validationOptions?: ValidationOptions) {
  return (object: any, propertyName: string) => {
    registerDecorator({
      target: object.constructor,
      propertyName,
      options: validationOptions,
      validator: NotMondayOrThursdayConstraint,
    });
  };
}

@ValidatorConstraint({name: 'NotMondayOrThursday'})
export class NotMondayOrThursdayConstraint implements ValidatorConstraintInterface {
  public async validate(date: Date = new Date(), args: ValidationArguments) {
    date = new Date(date);
    return !isMonday(date) && !isThursday(date);
  }
}