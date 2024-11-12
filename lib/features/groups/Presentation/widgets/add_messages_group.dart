import 'package:flutter/material.dart';
import 'package:scholar_chat/features/Screen/Presentation/screen_view/screen/widgets/appBar_item.dart';
import 'package:scholar_chat/features/groups/Presentation/widgets/add_messages_geoup_view.dart';

// ignore: camel_case_types
class addMessagesGroup extends StatelessWidget {
  const addMessagesGroup({Key? key}) : super(key: key);
  static String id = 'addMessagesGroup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarItem(
        automaticallyImplyLeading: true,
      ),
      body: const addMessagesGeoupBody(),
    );
  }
}
