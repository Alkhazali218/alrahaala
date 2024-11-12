import 'package:flutter/material.dart';
import 'package:scholar_chat/core/utils/api.dart';
import 'package:scholar_chat/models/messages_model.dart';

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
