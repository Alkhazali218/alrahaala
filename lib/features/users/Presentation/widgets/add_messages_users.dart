import 'package:alrahala/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable, camel_case_types
class addMessagesUsers extends StatefulWidget {
  addMessagesUsers({
    Key? key,
    required this.onTap,
    required this.onTapImage,
    required this.onTapFile,
    required this.controller,
  }) : super(key: key);
  Function(String) onTap;
  VoidCallback onTapImage;
  VoidCallback onTapFile;
  TextEditingController? controller;

  @override
  State<addMessagesUsers> createState() => _addMessagesUsersState();
}

// ignore: camel_case_types
class _addMessagesUsersState extends State<addMessagesUsers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Ink(
                      width: 45,
                      height: 45,
                      child: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: kColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      onSubmitted: widget.onTap,
                      decoration: const InputDecoration(
                        hintText: 'Messages',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: widget.onTapFile,
                    child: Ink(
                      width: 45,
                      height: 45,
                      child: const Icon(
                        Icons.camera_alt,
                        color: kColor,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: kprimaryColor,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: widget.onTapFile,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  FontAwesomeIcons.file,
                  color: kColor,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
