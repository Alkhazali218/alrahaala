// ignore: camel_case_types
class messagesModels {
  String? body;
  String? to;
  String? token;
  String? image;
  String? fileName;
  String? document;
  String? name;
  String? id;
  messagesModels({
    required this.body,
    required this.to,
    required this.token,
    required this.image,
    required this.fileName,
    required this.document,
  });

  factory messagesModels.fromJson(dynamic jsonData) {
    return messagesModels(
      body: jsonData['body'],
      to: jsonData['to'],
      token: jsonData['token'],
      image: jsonData['image'],
      fileName: jsonData['fileName'],
      document: jsonData['document'],
    );
  }
}
