import 'package:scholar_chat/core/utils/api.dart';
import 'package:scholar_chat/models/group_model.dart';

// ignore: camel_case_types
class getGroupServices {
  Future<List<GroupModel>> getGroup(
      {required String instance, required String token}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://api.ultramsg.com/$instance/groups?token=$token');

    List<GroupModel> groupList = [];
    for (int i = 0; i < data.length; i++) {
      groupList.add(
        GroupModel.fromJson(data[i]),
      );
    }
    return groupList;
  }
}
