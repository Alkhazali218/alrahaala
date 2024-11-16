import 'package:alrahala/core/utils/helper/show_snack_bar.dart';
import 'package:alrahala/cubits/messages_cubit/messages_cubit.dart';
import 'package:alrahala/cubits/messages_cubit/messages_state.dart';
import 'package:alrahala/features/users/Presentation/widgets/add_messages_users.dart';
import 'package:alrahala/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable, camel_case_types
class addMessagesGeoupBody extends StatefulWidget {
  const addMessagesGeoupBody({Key? key}) : super(key: key);

  @override
  State<addMessagesGeoupBody> createState() => _addMessagesGeoupBodyState();
}

// ignore: camel_case_types
class _addMessagesGeoupBodyState extends State<addMessagesGeoupBody> {
  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GroupModel group = ModalRoute.of(context)!.settings.arguments as GroupModel;
    return BlocConsumer<MessageCubit, MessageState>(
      listener: (context, state) {
        if (state is MessageError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Container(),
            ),
            addMessagesUsers(
              controller: _controller,
              onTapImage: () async {
                await BlocProvider.of<MessageCubit>(context).pickImage64();
              },
              onTapFile: () {
                BlocProvider.of<MessageCubit>(context).pickFile64();
              },
              onTap: (data) {
                setState(() {});
                try {
                  // Send the image if it exists, otherwise send a text message
                  BlocProvider.of<MessageCubit>(context)
                      .sendMessagesGroup(data: data, id: group.id);
                  _controller.clear();
                  data = null.toString();
                  showSnackBar(context, 'تم الارسال بنجاح', Colors.green);
                } on Exception catch (e) {
                  showSnackBar(context,
                      '${e.toString()}حدث خطا رجاءا اعد المحاولة', Colors.red);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
