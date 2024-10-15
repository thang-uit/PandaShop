import 'package:flutter/material.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static const double cornerRadius = 14.0;
  static const double fontSize = 14.0;

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle()
        .copyWith(fontSize: fontSize, color: Colors.black.withOpacity(0.4)),
    hintStyle: const TextStyle()
        .copyWith(fontSize: fontSize, color: Colors.black.withOpacity(0.4)),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 1, color: Colors.black38),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 1, color: Colors.black38),
    ),
    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: BorderSide(width: 1, color: Colors.black12.withOpacity(0.1)),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 1.5, color: Colors.black87),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 1.5, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle()
        .copyWith(fontSize: fontSize, color: Colors.white.withOpacity(0.4)),
    hintStyle: const TextStyle()
        .copyWith(fontSize: fontSize, color: Colors.white.withOpacity(0.4)),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(0.1)),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 1.5, color: Colors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 1.5, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );
}
