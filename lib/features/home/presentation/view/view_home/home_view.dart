import 'package:alrahala/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homeView extends StatelessWidget {
  const homeView({Key? key}) : super(key: key);
  static String id = 'homeView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: homeViewBody(),
    );
  }
}
