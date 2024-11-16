import 'package:alrahala/features/Screen/Presentation/screen_view/screen/widgets/appBar_item.dart';
import 'package:alrahala/features/Screen/Presentation/screen_view/screen/widgets/screen_view_body.dart';
import 'package:flutter/material.dart';

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
