import 'package:alrahala/core/utils/api.dart';
import 'package:alrahala/models/messages_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class sendImagesWhatsappServices {
  Future<messagesModels> sendImages({
    required String to,
    required String? image,
    @required String? instance,
    @required String? token,
    @required String? caption,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://api.ultramsg.com/$instance/messages/image',
      body: {
        'token': token,
        'to': to,
        'image': image,
        'caption': caption,
      },
      token: 'e6pu69njxhvbbj9a&$to',
    );
    return messagesModels.fromJson(data);
  }
}
