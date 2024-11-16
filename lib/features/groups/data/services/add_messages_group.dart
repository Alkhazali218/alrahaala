import 'package:alrahala/core/utils/api.dart';
import 'package:alrahala/models/group_model.dart';
import 'package:flutter/material.dart';

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
