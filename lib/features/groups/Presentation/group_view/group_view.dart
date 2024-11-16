import 'package:alrahala/features/Screen/Presentation/screen_view/screen/widgets/appBar_item.dart';
import 'package:alrahala/features/groups/Presentation/widgets/group_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class groupView extends StatelessWidget {
  const groupView({Key? key}) : super(key: key);
  static String id = 'groupView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarItem(automaticallyImplyLeading: true),
      body: const groupViewBody(),
    );
  }
}
