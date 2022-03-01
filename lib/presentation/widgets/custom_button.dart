import 'package:flutter/material.dart';
import 'package:ourpass_int/utils/colors.dart';

class CustomButton extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final Color? textColor;

  const CustomButton(
      {Key? key, this.onPressed, this.buttonStyle, this.textColor, this.child})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Center(child: widget.child),
      style: widget.buttonStyle,
      onPressed: widget.onPressed,
    );
  }
}

ButtonStyle buttonStyle(
    {Color color = AppColors.primaryColor,
    double buttonWidth = 362,
    double buttonHeight = 54,
    double elevation = 1,
    double radius = 5,
    bool showBorder = false}) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(color),
    elevation: MaterialStateProperty.all<double>(elevation),
    fixedSize: MaterialStateProperty.all<Size>(
      Size(buttonWidth, buttonHeight),
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    ),
  );
}
