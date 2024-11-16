import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:alrahala/cubits/messages_cubit/messages_state.dart';
import 'package:alrahala/features/users/data/services/file_messages.dart';
import 'package:alrahala/features/users/data/services/image_messages.dart';
import 'package:alrahala/features/users/data/services/send_messages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());
  String? number;
  File? _image;
  File? _file;
  String? base64Image;
  String? base64File;
  String? token;
  String? instance;
  Future<void> validateCredentials(
      String userToken, String userInstance) async {
    token = userToken; // Set the token
    instance = userInstance; // Set the instance
    final url = 'https://api.ultramsg.com/$instance/'; // Your API endpoint

    try {
      emit(MessageLoading()); // Emit loading state if needed

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Assuming a successful response means valid credentials
        emit(MessageSent()); // Emit authenticated state
        // Navigate to the next screen (you may need to handle this in your UI)
      } else {
        emit(MessageError('يوجد خطا في ادخال البيانات')); // Emit error state
      }
    } catch (error) {
      emit(MessageError('حدث خطأ في الاتصال بالخادم')); // Emit error state
    }
  }

  Future<void> pickFile64() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String? filePath = result.files.first.path;
      if (filePath != null) {
        _file = File(filePath);
        Uint8List bytes = _file!.readAsBytesSync();
        base64File = base64Encode(bytes);
      }
    }
  }

  Future<void> pickImage64() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      Uint8List bytes = _image!.readAsBytesSync();
      base64Image = base64Encode(bytes);
    }
  }

  void sendMessages(String data) {
    if (_image != null) {
      sendImages(data);
      _image = null; // Clear the image after sending
      base64Image = null; // Clear the base64 image after sending
    } else if (_file != null) {
      sendFiles(data);
      _file = null; // Clear the file after sending
      base64File = null; // Clear the base64 file after sending
    } else {
      sendTextMessages(data);
    }
  }

  void sendImages(String data) {
    sendImagesWhatsappServices().sendImages(
      to: number!,
      image: base64Image,
      instance: instance,
      token: token,
      caption: data,
    );
  }

  void sendTextMessages(String data) {
    sendMessagesWhatsAppServices().sendMessages(
      to: number!,
      body: data,
      instance: instance,
      token: token,
    );
  }

  void sendFiles(String data) {
    sendFilesWhatsAppServices().sendFile(
      fileName: _file!.path.split('.').last,
      document: base64File!,
      to: number!,
      caption: data,
      instance: instance,
      token: token,
    );
  }

  //is the send messages in Group

  void sendTextMessagesGroup({required String data, required String id}) {
    sendMessagesWhatsAppServices().sendMessages(
      to: id,
      body: data,
      instance: instance,
      token: token,
    );
  }

  void sendImagesGroup({required String data, required String id}) {
    sendImagesWhatsappServices().sendImages(
      to: id,
      image: base64Image,
      instance: instance,
      token: token,
      caption: data,
    );
  }

  void sendFilesGroup({required String data, required String id}) {
    sendFilesWhatsAppServices().sendFile(
      fileName: _file!.path.split('.').last,
      document: base64File!,
      to: id,
      caption: data,
      instance: instance,
      token: token,
    );
  }

  void sendMessagesGroup({required String data, required String id}) {
    if (_image != null) {
      sendImagesGroup(data: data, id: id);
      _image = null;
      base64Image = null;
    } else if (_file != null) {
      sendFilesGroup(data: data, id: id);
      _image = null;
      base64Image = null;
    } else {
      sendTextMessagesGroup(data: data, id: id);
    }
  }
}
