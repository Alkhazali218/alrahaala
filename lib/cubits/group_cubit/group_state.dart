import 'package:alrahala/models/group_model.dart';

abstract class GroupState {}

class GroupInitial extends GroupState {}

class GroupLoading extends GroupState {}

class GroupScuess extends GroupState {
  final List<GroupModel> groups;

  GroupScuess(this.groups);
}

class GroupError extends GroupState {}

// ignore: camel_case_types
class groupSearch extends GroupState {
  final List<GroupModel> filteredData;

  groupSearch(this.filteredData);
}
