import 'package:flutter/material.dart';

Widget horizontalSpaceTiny = SizedBox(width: 5.0);
Widget horizontalSpaceSmall = SizedBox(width: 10.0);
Widget horizontalSpaceMedium = SizedBox(width: 25.0);

Widget verticalSpaceTiny = SizedBox(height: 5.0);
Widget verticalSpaceSmall = SizedBox(height: 10.0);
Widget verticalSpaceMedium = SizedBox(height: 25.0);
Widget verticalSpaceSpecial = SizedBox(height: 40.0);
Widget verticalSpaceLarge = SizedBox(height: 50.0);
Widget verticalSpaceMassive = SizedBox(height: 120.0);

Widget spacedDivider = Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);
Widget horizontalSpace(double width) => SizedBox(width: width);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double height(double height) => height;

double width(double width) => width;
