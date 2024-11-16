import 'package:alrahala/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types, must_be_immutable
class customButton extends StatelessWidget {
  customButton({Key? key, required this.ontap}) : super(key: key);
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'تسجيل الدخول',
            style: GoogleFonts.amiri(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
