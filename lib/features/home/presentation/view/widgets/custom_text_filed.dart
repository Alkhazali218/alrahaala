import 'package:alrahala/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFromField extends StatelessWidget {
  String hintText;
  Icon? suffixIcon;
  Function(String) onChanged;
  TextInputType? inputType;
  CustomTextFromField(
      {Key? key,
      required this.hintText,
      @required this.suffixIcon,
      required this.onChanged,
      this.inputType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'رجاءا ادخل البيانات';
        }
        return null; // Return null if the input is valid
      },
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: kColor,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: kprimaryColor,
          ),
        ),
        hintStyle: const TextStyle(color: kprimaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: kprimaryColor,
          ),
        ),
      ),
    );
  }
}
