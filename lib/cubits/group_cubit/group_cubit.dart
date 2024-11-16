// ignore: depend_on_referenced_packages
import 'package:alrahala/cubits/group_cubit/group_state.dart';
import 'package:alrahala/features/groups/data/services/get_groups.dart';
import 'package:alrahala/models/group_model.dart';
import 'package:bloc/bloc.dart';

// ignore: camel_case_types
class groupCubit extends Cubit<GroupState> {
  groupCubit() : super(GroupInitial());

  List<GroupModel> groups = [];
  List<GroupModel> filteredData = [];
  void getGroup() async {
    emit(GroupLoading());
    try {
      groups = await getGroupServices()
          .getGroup(instance: 'instance22671', token: 'e6pu69njxhvbbj9a');
      emit(GroupScuess(groups));
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(GroupError());
    }
  }
}
