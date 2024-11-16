import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholar_chat/core/utils/assets.dart';
import 'package:scholar_chat/features/groups/Presentation/widgets/add_messages_group.dart';
import 'package:scholar_chat/models/group_model.dart';

// ignore: must_be_immutable, camel_case_types
class customCardItem extends StatelessWidget {
  customCardItem({Key? key, required this.group}) : super(key: key);
  GroupModel? group;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, addMessagesGroup.id, arguments: group);
      },
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 20,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        group!.name,
                        style: GoogleFonts.amiri(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: -65,
              child: Image.asset(assets.klogo, height: 140),
            ),
          ],
        ),
      ),
    );
  }
}
