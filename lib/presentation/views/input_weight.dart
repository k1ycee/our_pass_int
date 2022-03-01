import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourpass_int/models/user_weight_model.dart';
import 'package:ourpass_int/presentation/view_models/user_vm.dart';
import 'package:ourpass_int/presentation/widgets/custom_button.dart';
import 'package:ourpass_int/presentation/widgets/custom_text.dart';
import 'package:ourpass_int/presentation/widgets/custom_text_field.dart';
import 'package:ourpass_int/utils/colors.dart';
import 'package:ourpass_int/utils/margins.dart';
import 'package:provider/provider.dart';

class InputWeight extends StatefulWidget {
  const InputWeight({Key? key}) : super(key: key);

  @override
  _InputWeightState createState() => _InputWeightState();
}

class _InputWeightState extends State<InputWeight> {
  TextEditingController weightController = TextEditingController();
  String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              controller: weightController,
              title: "Today's Weight measurement",
              hintText: "Input Weight",
              valdator: (value) {
                if (value!.isEmpty) {
                  return "Field Cannot be empty";
                }
              },
              inputType: TextInputType.number,
            ),
            verticalSpaceSmall,
            CustomButton(
              child: CustomText(
                "Log",
                color: AppColors.backgroundColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              onPressed: () async {
                authModel.registerUserWeight(
                  UserWeightModel(
                    userId: userId,
                    weight: double.parse(weightController.text),
                    day: DateTime.now().day.toString(),
                  ),
                );
              },
              buttonStyle: buttonStyle(
                  buttonWidth: 204, buttonHeight: 36.6, radius: 4.57),
            )
          ],
        ),
      ),
    );
  }
}
