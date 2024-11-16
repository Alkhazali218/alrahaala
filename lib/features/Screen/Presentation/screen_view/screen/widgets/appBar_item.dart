// ignore: file_names
import 'package:alrahala/const.dart';
import 'package:alrahala/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types, must_be_immutable
class appBarItem extends StatelessWidget implements PreferredSizeWidget {
  appBarItem({Key? key, @required this.automaticallyImplyLeading})
      : super(key: key);
  bool? automaticallyImplyLeading = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading!,
      foregroundColor: Colors.white,
      centerTitle: true,
      backgroundColor: kprimaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'شركة الرحالة',
            style: GoogleFonts.amiri(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Image.asset(assets.klogo, height: 65),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
