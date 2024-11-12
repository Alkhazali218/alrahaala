import 'package:bloc/bloc.dart';
import 'package:scholar_chat/cubits/group_cubit/group_state.dart';
import 'package:scholar_chat/features/groups/data/services/get_groups.dart';
import 'package:scholar_chat/models/group_model.dart';

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
