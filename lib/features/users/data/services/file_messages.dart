import 'package:alrahala/core/utils/api.dart';
import 'package:alrahala/models/messages_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class sendFilesWhatsAppServices {
  Future<messagesModels> sendFile({
    required String fileName,
    required String document,
    required String to,
    @required String? caption,
    @required String? instance,
    @required String? token,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://api.ultramsg.com/$instance/messages/document',
      body: {
        'token': token,
        'to': to,
        'filename': fileName,
        'document': document,
        'caption': caption,
      },
      token: 'e6pu69njxhvbbj9a&$to',
    );

    return messagesModels.fromJson(data);
  }
}
