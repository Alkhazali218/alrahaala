import 'package:alrahala/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable, camel_case_types
class stackItem extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  stackItem(
      {Key? key,
      required this.textIcon,
      required this.iconsItem,
      required this.onTap})
      : super(key: key);
  final String textIcon;
  final Icon iconsItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kprimaryColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          Positioned(
            left: 110,
            right: 100,
            bottom: 80,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                iconsItem,
                const SizedBox(
                  height: 50,
                ),
                Text(
                  textIcon,
                  style: GoogleFonts.amiri(
                    fontSize: 20,
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
