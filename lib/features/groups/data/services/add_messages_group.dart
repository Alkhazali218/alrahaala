import 'package:flutter/material.dart';
import 'package:scholar_chat/core/utils/api.dart';
import 'package:scholar_chat/models/group_model.dart';

// ignore: camel_case_types
class sendMessagesGroupWhatsAppServices {
  Future<GroupModel> sendMessagesGroup({
    required String id,
    @required String? body,
    @required String? instance,
    @required String? token,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://api.ultramsg.com/$instance/groups?token=$token',
      body: {
        "id": id,
      },
      token: 'e6pu69njxhvbbj9a',
    );
    return GroupModel.fromJson(data);
  }
}
