import 'package:alrahala/cubits/group_cubit/group_cubit.dart';
import 'package:alrahala/cubits/messages_cubit/messages_cubit.dart';
import 'package:alrahala/features/Screen/Presentation/screen_view/screen/screen_view.dart';
import 'package:alrahala/features/groups/Presentation/group_view/group_view.dart';
import 'package:alrahala/features/groups/Presentation/widgets/add_messages_group.dart';
import 'package:alrahala/features/home/presentation/view/view_home/home_view.dart';
import 'package:alrahala/features/users/Presentation/users_view/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MessageCubit()),
        BlocProvider(create: (context) => groupCubit()..getGroup()),
      ],
      child: MaterialApp(
        routes: {
          homeView.id: (context) => const homeView(),
          screenView.id: (context) => const screenView(),
          usersView.id: (context) => const usersView(),
          groupView.id: (context) => const groupView(),
          addMessagesGroup.id: (context) => const addMessagesGroup(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: homeView.id,
      ),
    );
  }
}
