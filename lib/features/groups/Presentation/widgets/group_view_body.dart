import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/const.dart';
import 'package:scholar_chat/core/utils/assets.dart';
import 'package:scholar_chat/cubits/group_cubit/group_cubit.dart';
import 'package:scholar_chat/cubits/group_cubit/group_state.dart';
import 'package:scholar_chat/features/groups/Presentation/widgets/custom_card_item.dart';
import 'package:scholar_chat/features/home/presentation/view/widgets/custom_text_filed.dart';
import 'package:scholar_chat/models/group_model.dart';

// ignore: camel_case_types
class groupViewBody extends StatefulWidget {
  const groupViewBody({Key? key}) : super(key: key);
  @override
  State<groupViewBody> createState() => _groupViewBodyState();
}

// ignore: camel_case_types
class _groupViewBodyState extends State<groupViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<groupCubit>(context).getGroup();
  }

  GroupModel? groupModel;
  List<GroupModel> groups = [];
  List<GroupModel> filteredData = [];
  @override
  Widget build(BuildContext context) {
    groups = BlocProvider.of<groupCubit>(context).groups;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFromField(
              hintText: 'البحث عن مجموعة',
              suffixIcon: const Icon(
                Icons.search,
              ),
              onChanged: (data) {
                setState(() {
                  addDataFilteredData(input: data);
                });
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
              child: BlocBuilder<groupCubit, GroupState>(
                builder: (context, state) {
                  if (state is GroupLoading) {
                    return const Center(
                        child: CircularProgressIndicator(color: kColor));
                  } else if (state is GroupScuess) {
                    groups = state.groups; // Use the groups from the state
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.12,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 65,
                      ),
                      itemCount: filteredData.isNotEmpty
                          ? filteredData.length
                          : groups.length,
                      itemBuilder: (context, index) {
                        return customCardItem(
                          group: filteredData.isNotEmpty
                              ? filteredData[index]
                              : groups[index],
                        );
                      },
                    );
                  } else {
                    return Column(
                      children: [
                        Image.asset(assets.klogo),
                        const Text('حدث خطا'),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void addDataFilteredData({required String input}) {
    filteredData = groups
        .where((element) => element.name.toLowerCase().startsWith(input))
        .toList();
  }
}
