import 'package:alrahala/features/Screen/Presentation/screen_view/screen/widgets/appBar_item.dart';
import 'package:alrahala/features/groups/Presentation/widgets/add_messages_geoup_view.dart';
import 'package:flutter/material.dart';

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
