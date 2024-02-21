import React from "react";
import { Text, TextInput, View } from "react-native";
import { Controller } from "react-hook-form";
import { TextInputFieldProps } from "./text-input.props";

function ErrorMessage({ fieldName, errors }) {
  if (errors[fieldName] && errors[fieldName].message) {
    return (
      <Text className="border-2 border-red text-red">
        {errors[fieldName].message}
      </Text>
    );
  }
  return null;
}

export function TextInputField(props: TextInputFieldProps) {
  const {
    text,
    inputMode = "none",
    fieldName,
    control,
    errors,
    rules,
    placeholder,
    keyboardType = "default",
    onChangeText,
    label,
  } = props;

  const handleChangeInput = (val: any, onChange: (...event: any[]) => void) => {
    onChange(val);
    onChangeText(val);
  };

  return (
    <View className="flex-auto flex-row items-center">
      <View className="flex w-full flex-col">
        <View className="w-full">
          <View
            className={`h-[75px] flex-auto rounded-md border ${
              errors[fieldName] ? "border-2 border-red" : "mb-2"
            } bg-white-100 px-4 py-3`}
          >
            <View className="flex-row items-center justify-between">
              <View>
                <Text
                  className={`font-primary-400 text-sm font-normal leading-tight text-stone-500 ${
                    errors[fieldName] ? "text-red" : "text-stone-500"
                  }`}
                >
                  {text}
                </Text>
              </View>
            </View>
            <Controller
              name={fieldName}
              control={control}
              rules={rules}
              render={({ field: { onChange, onBlur } }) => (
                <TextInput
                  value={label}
                  onBlur={onBlur}
                  onChangeText={(val) => {
                    handleChangeInput(val, onChange);
                  }}
                  inputMode={inputMode}
                  keyboardType={keyboardType}
                  className="font-primary-500 text-lg text-stone-800"
                  placeholder={placeholder}
                />
              )}
            />
          </View>
        </View>
        <View className="mb-2 w-full">
          <ErrorMessage fieldName={fieldName} errors={errors} />
        </View>
      </View>
    </View>
  );
}
