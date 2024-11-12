import 'package:flutter/material.dart';
import 'package:scholar_chat/features/Screen/Presentation/screen_view/screen/widgets/appBar_item.dart';
import 'package:scholar_chat/features/Screen/Presentation/screen_view/screen/widgets/screen_view_body.dart';

// ignore: camel_case_types
class screenView extends StatelessWidget {
  const screenView({Key? key}) : super(key: key);
  static String id = 'screenView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarItem(
        automaticallyImplyLeading: false,
      ),
      body: const screenViewBody(),
    );
  }
}
