import 'package:flutter/material.dart';
import 'package:scholar_chat/features/Screen/Presentation/screen_view/screen/widgets/appBar_item.dart';
import 'package:scholar_chat/features/users/Presentation/widgets/users_view_body.dart';

// ignore: camel_case_types
class usersView extends StatelessWidget {
  const usersView({Key? key}) : super(key: key);
  static String id = 'usersView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarItem(
        automaticallyImplyLeading: true,
      ),
      body: const usersViewBody(),
    );
  }
}
