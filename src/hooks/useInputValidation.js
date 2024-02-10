import { Validator } from "./utils/Validator";

export const useInputValidation = (inputValues) => {
  const errorResults = {};
  const { firstName, lastName, email, password } = inputValues;
  for (let value in inputValues) {
    if (value === "firstName") {
      const firstNameValidator = new Validator("first name", firstName);
      const errors = firstNameValidator.isNull().run();
      errorResults["first name"] = errors["first name"];
    }
    if (value === "lastName") {
      const lastNameValidator = new Validator("last name", lastName);
      const errors = lastNameValidator.isNull().run();
      errorResults["last name"] = errors["last name"];
    }
    if (value === "email") {
      const emailValidator = new Validator("email", email);
      const errors = emailValidator.isNull().isEmail().run();
      errorResults["email"] = errors.email;
    }
    if (value === "password") {
      const passwordValidator = new Validator("password", password);
      const errors = passwordValidator.isNull().minLen(6).run();
      errorResults["password"] = errors.password;
    }
  }
  return {
    errorResults,
  };
};
