import { Control, FieldErrors } from "react-hook-form"
import { KeyboardTypeOptions, TextInputProps } from "react-native"

type CustomValidationRules = {
  required?: boolean | string
  minLength?: {
    value: number
    message: string
  }
  maxLength?: {
    value: number
    message: string
  }
  pattern?: {
    value: RegExp
    message: string
  }
}

export interface TextInputFieldProps extends TextInputProps {
  label?: string
  text?: string
  fieldName: string
  placeholder?: string
  rules?: CustomValidationRules
  control: Control<any>
  errors: FieldErrors<any>
  keyboardType?: KeyboardTypeOptions
}
