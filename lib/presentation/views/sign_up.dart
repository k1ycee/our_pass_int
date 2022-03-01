import 'package:flutter/material.dart';
import 'package:ourpass_int/presentation/view_models/user_vm.dart';
import 'package:ourpass_int/presentation/widgets/custom_button.dart';
import 'package:ourpass_int/presentation/widgets/custom_text.dart';
import 'package:ourpass_int/utils/colors.dart';
import 'package:ourpass_int/utils/margins.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                "Welcome to Gains",
                fontSize: 25,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              verticalSpaceSmall,
              CustomButton(
                child: CustomText(
                  "Sign In",
                  color: AppColors.backgroundColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                onPressed: () {
                  authModel.signInAnonymously();
                },
                buttonStyle: buttonStyle(
                    buttonWidth: 204, buttonHeight: 36.6, radius: 4.57),
              )
            ],
          ),
        ],
      ),
    );
  }
}
