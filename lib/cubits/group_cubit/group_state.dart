import 'package:scholar_chat/models/group_model.dart';

abstract class GroupState {}

class GroupInitial extends GroupState {}

class GroupLoading extends GroupState {}

class GroupScuess extends GroupState {
  final List<GroupModel> groups;

  GroupScuess(this.groups);
}

class GroupError extends GroupState {}

class groupSearch extends GroupState {
  final List<GroupModel> filteredData;

  groupSearch(this.filteredData);
}
