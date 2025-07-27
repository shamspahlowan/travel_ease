import 'package:flutter/material.dart';

enum SpTextBoxType { name, email, password, phone, confirmPass }

extension SpTextBoxTypeExtention on SpTextBoxType {
  String get placeholderText {
    switch (this) {
      case SpTextBoxType.email:
        return "example@gmail.com";
      case SpTextBoxType.password:
        return "Password";
      case SpTextBoxType.name:
        return "Username";
      case SpTextBoxType.phone:
        return "Phone Number";
      case SpTextBoxType.confirmPass:
        return "Confirm Password";
    }
  }

  TextInputType get keyboardType {
    switch (this) {
      case SpTextBoxType.email:
        return TextInputType.emailAddress;
      case SpTextBoxType.password:
        return TextInputType.text;
      case SpTextBoxType.name:
        return TextInputType.text;
      case SpTextBoxType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  Icon get placeholderIcon {
    switch (this) {
      case SpTextBoxType.email:
        return Icon(Icons.email_outlined);
      case SpTextBoxType.password:
        return Icon(Icons.remove_red_eye_outlined);
      case SpTextBoxType.name:
        return Icon(Icons.person);
      case SpTextBoxType.phone:
        return Icon(Icons.phone);
      case SpTextBoxType.confirmPass:
        return Icon(Icons.remove_red_eye_outlined);
    }
  }

  bool get obscure {
    return this == SpTextBoxType.password;
  }
}
