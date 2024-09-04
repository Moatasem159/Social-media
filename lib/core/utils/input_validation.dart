import 'package:flutter/material.dart';
import 'package:social_media/core/extensions/context_extensions.dart';
class InputValidator {
  /// Validate Egyptian [phoneNumber]
  static String? validateEgyptianPhoneNumber(String phoneNumber,BuildContext context) {
    final RegExp regex = RegExp(r'^(010|011|012|015)\d{8}$');
    if (phoneNumber.isEmpty) {
      return context.locale.required;
    }
    if (!regex.hasMatch(phoneNumber)) {
      return context.locale.invalidPhoneFormat;
    }
    return null;
  }
  /// Validate [email]
  static String? validateEmail(String email,BuildContext context) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (email.isEmpty) {
      return context.locale.required;
    }
    if (!emailRegex.hasMatch(email)) {
      return context.locale.invalidEmailFormat;
    }
    return null;
  }
  /// Validate [name]
  static String? validateName(String name,BuildContext context) {
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (name.isEmpty) {
      return context.locale.required;
    }
    if (!nameRegex.hasMatch(name)) {
      return context.locale.invalidName;
    }
    return null;
  }
  /// Validate [password]
  static String? validatePassword(String password,BuildContext context) {
    if (password.isEmpty) {
      return context.locale.required;
    }
    if(!hasLowerCase(password)) {
      return context.locale.required;
    }
    if(!hasUpperCase(password)) {
      return context.locale.required;
    }
    if(!hasNumber(password)) {
      return context.locale.required;
    }
    if(!hasSpecialCharacter(password)) {
      return context.locale.required;
    }
    if(!hasMinLength(password)) {
      return context.locale.required;
    }
    return null;
  }
  /// Validate [confirmPassword]
  static String? validateConfirmPassword(String confirmPassword, String password,BuildContext context) {
    if (confirmPassword.isEmpty) {
      return context.locale.required;
    }

    if (confirmPassword != password) {
      return context.locale.passwordsDoNotMatch;
    }

    return null;
  }
  /// Validate [date]
  static String? validateDate(String date, BuildContext context) {
    if (date.isEmpty) {
      return context.locale.required;
    }
    return null;
  }
  /// check [password] has lowercase
  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }
  /// check [password] has uppercase
  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }
  /// check [password] has number
  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }
  /// check [password] has Special character
  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }
  /// check [password] minimum length
  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}