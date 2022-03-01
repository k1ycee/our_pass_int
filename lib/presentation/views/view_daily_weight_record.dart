import 'package:flutter/material.dart';
import 'package:ourpass_int/constants/routes.dart';
import 'package:ourpass_int/presentation/view_models/user_vm.dart';
import 'package:ourpass_int/presentation/widgets/custom_button.dart';
import 'package:ourpass_int/presentation/widgets/custom_text.dart';
import 'package:ourpass_int/utils/colors.dart';
import 'package:ourpass_int/utils/margins.dart';
import 'package:provider/provider.dart';

class DailyWeightRecord extends StatefulWidget {
  const DailyWeightRecord({Key? key}) : super(key: key);

  @override
  _DailyWeightRecordState createState() => _DailyWeightRecordState();
}

class _DailyWeightRecordState extends State<DailyWeightRecord> {
  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              customDialog(
                context,
                SignOutWarning(
                  onTap: () {
                    authModel.signOut();
                  },
                ),
              );
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.InsertWeightRoute);
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add),
      ),
      // body: Column(),
      body: authModel.isBusy
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
          : ListView.builder(
              itemCount: authModel.userWeights.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: CustomText(
                          "This Feature is not yet available",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        duration: Duration(seconds: 1),
                        backgroundColor: AppColors.primaryColor,
                      ),
                    );
                  },
                  title: CustomText(
                    "${authModel.userWeights[index].weight.toString()} kg",
                    fontSize: 14,
                    color: AppColors.primaryColor,
                  ),
                  subtitle: CustomText(
                    "Tap to Edit",
                    fontSize: 12,
                    color: AppColors.primaryColor,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      authModel
                          .delete(authModel.userWeights[index].documentId!);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class SignOutWarning extends StatelessWidget {
  final VoidCallback? onTap;
  const SignOutWarning({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  "Warning!",
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ],
            ),
            verticalSpaceMedium,
            CustomText(
              "If you sign out, you'll lose all your data",
              color: Colors.black,
              fontSize: 14,
            ),
            verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: CustomText(
                    "No",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  buttonStyle: buttonStyle(
                    buttonWidth: 70,
                    radius: 4.57,
                  ),
                ),
                CustomButton(
                  onPressed: onTap,
                  child: CustomText(
                    "Yes",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  buttonStyle: buttonStyle(
                    buttonWidth: 70,
                    radius: 4.57,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

customDialog(BuildContext context, Widget child,
    {double dialogHeight = 300, double dialogWidth = 400}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
          height: height(dialogHeight),
          width: width(dialogWidth),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: child),
    ),
  );
}
