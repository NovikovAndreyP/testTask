import { registerDecorator, ValidationArguments, ValidationOptions, ValidatorConstraint } from "class-validator";
import { isAfter } from "date-fns";

export function IsAfter(property: string, validationOptions?: ValidationOptions) {
  return (object: any, propertyName: string) => {
    registerDecorator({
      target: object.constructor,
      propertyName,
      options: validationOptions,
      constraints: [property],
      validator: IsAfterConstraint,
    });
  };
}

@ValidatorConstraint({name: 'IsAfter'})
export class IsAfterConstraint {
  public async validate(date: Date = new Date(), args: ValidationArguments) {
    date = new Date(date);
    const [relatedPropertyName] = args.constraints;
    const dateToCompare = new Date((args.object as any)[relatedPropertyName]);
    return isAfter(date, dateToCompare);
  }
}