

import 'package:ill_vent/core/utils/app_string.dart';
import 'package:ill_vent/core/utils/strings_manager.dart';

import 'constant.dart';

class Validator {
  static String? email(String? value) {
    if(value!.isEmpty){
      return StringsManager.emptyValidation;
    }
    if (!RegExp(Constant.regExValidateEmail)
        .hasMatch(value ?? "")) {
      return StringsManager.notValidEmail;
    }
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordCantBeEmpty;
    }
    if (value.length < 6) {
      return AppStrings.passwordMustBeAtLeast6Characters;
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeastOneUppercaseLetter;
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeastOneNumber;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return AppStrings.passwordMustContainAtLeastOneSpecialCharacter;
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordCantBeEmpty;
    }

    if (value != password) {
      return AppStrings.passwordsDoNotMatch;
    }
    return null;
  }

  static String? userName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.userNameCannotBeEmpty;
    }
    if (value.length > 20) {
      return AppStrings.userNameCannotBeMoreThan20Characters;
    }
    return null;
  }

  static String? firstName(String? value)  {
    if (value == null || value.trim().isEmpty) {
      return "Please enter a name";
    }
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(value.trim())) {
      return "Name must contain only letters";
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter a name";
    }
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(value.trim())) {
      return "Name must contain only letters";
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter a phone number";
    }
    final phoneRegExp = RegExp(r'^(01)[0-9]{9}$');
    if (!phoneRegExp.hasMatch(value.trim())) {
      return "Enter a valid Egyptian phone number";
    }
    return null;
  }

}