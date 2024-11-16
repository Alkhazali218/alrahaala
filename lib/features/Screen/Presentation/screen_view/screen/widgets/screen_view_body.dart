import 'package:alrahala/const.dart';
import 'package:alrahala/features/Screen/Presentation/screen_view/screen/widgets/stack_item.dart';
import 'package:alrahala/features/groups/Presentation/group_view/group_view.dart';
import 'package:alrahala/features/users/Presentation/users_view/users_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class screenViewBody extends StatelessWidget {
  const screenViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 50),
        stackItem(
          onTap: () {
            Navigator.pushNamed(context, usersView.id);
          },
          textIcon: 'ارسال رسالة الى المستخدم',
          iconsItem: const Icon(
            FontAwesomeIcons.userTie,
            color: kColor,
            size: 50,
          ),
        ),
        const Divider(
          color: kprimaryColor,
          thickness: 1,
          indent: 11,
          endIndent: 11,
        ),
        stackItem(
          onTap: () {
            Navigator.pushNamed(context, groupView.id);
          },
          textIcon: 'ارسال رسالة الى المجموعة',
          iconsItem: const Icon(
            FontAwesomeIcons.users,
            color: kColor,
            size: 50,
          ),
        ),
      ],
    );
  }
}
