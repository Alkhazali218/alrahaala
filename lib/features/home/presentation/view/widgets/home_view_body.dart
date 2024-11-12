import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/const.dart';
import 'package:scholar_chat/core/utils/assets.dart';
import 'package:scholar_chat/core/utils/helper/show_snack_bar.dart';
import 'package:scholar_chat/cubits/messages_cubit/messages_cubit.dart';
import 'package:scholar_chat/cubits/messages_cubit/messages_state.dart';
import 'package:scholar_chat/features/Screen/Presentation/screen_view/screen/screen_view.dart';
import 'package:scholar_chat/features/home/presentation/view/widgets/custom_button.dart';
import 'package:scholar_chat/features/home/presentation/view/widgets/custom_text_filed.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class homeViewBody extends StatefulWidget {
  const homeViewBody({Key? key}) : super(key: key);

  @override
  State<homeViewBody> createState() => _homeViewBodyState();
}

// ignore: camel_case_types
class _homeViewBodyState extends State<homeViewBody> {
  String? token;
  String? instance;
  bool isLoading = false;

  GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<MessageCubit, MessageState>(
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            progressIndicator: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kColor),
            ),
            child: Form(
              key: fromKey,
              child: ListView(
                children: [
                  const SizedBox(height: 55),
                  Image.asset(
                    assets.klogo,
                    height: 200,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'شركة الرحالة القابضة',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: kprimaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFromField(
                    inputType: TextInputType.number,
                    hintText: 'Number',
                    suffixIcon: const Icon(Icons.add_call),
                    onChanged: (data) {
                      // Store number if needed
                      BlocProvider.of<MessageCubit>(context).number = data;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFromField(
                    hintText: 'Token',
                    suffixIcon: const Icon(Icons.token),
                    onChanged: (data) {
                      token = data; // Store token locally
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFromField(
                    hintText: 'Instance',
                    suffixIcon: const Icon(Icons.pin),
                    onChanged: (data) {
                      instance = data; // Store instance locally
                    },
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    ontap: () async {
                      if (fromKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true; // Start loading
                        });

                        // Validate credentials
                        await validateCredentials(token!, instance!);

                        // Save token and instance in Cubit
                        BlocProvider.of<MessageCubit>(context).token = token;
                        BlocProvider.of<MessageCubit>(context).instance =
                            instance;

                        setState(() {
                          isLoading = false; // Stop loading
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> validateCredentials(String token, String instance) async {
    final url = 'https://api.ultramsg.com/$instance/'; // Your API endpoint
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Assuming a successful response means valid credentials
        Navigator.pushNamed(context, screenView.id);
      } else {
        // Handle error response
        showSnackBar(context, 'يوجد خطا في ادخال البيانات', Colors.red);
      }
    } catch (error) {
      // Handle any exceptions
      showSnackBar(context, 'حدث خطأ في الاتصال بالخادم', Colors.red);
    }
  }
}
