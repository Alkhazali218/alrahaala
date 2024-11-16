import 'package:alrahala/core/utils/api.dart';
import 'package:alrahala/models/messages_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class sendMessagesWhatsAppServices {
  Future<messagesModels> sendMessages({
    required String to,
    @required String? body,
    @required String? instance,
    @required String? token,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://api.ultramsg.com/$instance/messages/chat',
      body: {
        'token': token,
        'to': to,
        'body': body,
      },
      token: 'e6pu69njxhvbbj9a&$to',
    );
    return messagesModels.fromJson(data);
  }
}
