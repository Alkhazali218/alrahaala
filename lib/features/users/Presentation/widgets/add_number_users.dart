import 'package:flutter/material.dart';
import 'package:scholar_chat/const.dart';

// ignore: must_be_immutable, camel_case_types
class addNumbersUsers extends StatelessWidget {
  addNumbersUsers({Key? key, required this.onTap, this.inputType})
      : super(key: key);
  Function(String) onTap;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // ignore: body_might_complete_normally_nullable
      validator: (data) {
        if (data!.isEmpty) {
          return 'رجاءا ادخل رقم الهاتف';
        }
      },
      keyboardType: inputType,
      onChanged: onTap,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.add_call),
        suffixIconColor: kColor,
        contentPadding: EdgeInsets.all(16),
        hintText: ' 09XXXXXXXX',
        hintStyle: TextStyle(
          color: kprimaryColor,
        ),
      ),
    );
  }
}
