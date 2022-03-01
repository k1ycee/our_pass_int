import 'package:flutter/material.dart';
import 'package:ourpass_int/presentation/widgets/custom_text.dart';
import 'package:ourpass_int/utils/colors.dart';
import 'package:ourpass_int/utils/margins.dart';

class CustomTextField extends StatefulWidget {
  final String? title, hintText, initialValue;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool filled;
  final FormFieldValidator<String?>? valdator;
  final double titleFontSize;
  const CustomTextField(
      {Key? key,
      this.title,
      this.obscure = false,
      this.controller,
      this.inputType,
      this.hintText,
      this.filled = false,
      this.valdator,
      this.titleFontSize = 16,
      this.initialValue})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(105),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            widget.title,
            fontSize: widget.titleFontSize,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
          verticalSpaceTiny,
          Container(
            height: height(75),
            width: double.infinity,
            child: TextFormField(
              initialValue: widget.initialValue,
              keyboardType: widget.inputType,
              controller: widget.controller,
              obscureText: !isPasswordVisible && widget.obscure,
              validator: widget.valdator,
              decoration: InputDecoration(
                filled: widget.filled,
                fillColor: AppColors.primaryColor.withOpacity(0.1),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                suffixIcon: widget.obscure
                    ? IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        color: AppColors.primaryColor)
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
