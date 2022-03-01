import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourpass_int/constants/routes.dart';
import 'package:ourpass_int/presentation/views/input_weight.dart';
import 'package:ourpass_int/presentation/views/sign_up.dart';
import 'package:ourpass_int/presentation/views/view_daily_weight_record.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.SignUpRoute:
      return _getPageRoute(routeName: settings.name, view: SignUpPage());
    case Routes.InsertWeightRoute:
      return _getPageRoute(routeName: settings.name, view: InputWeight());
    case Routes.ViewWeightRoute:
      return _getPageRoute(routeName: settings.name, view: DailyWeightRecord());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? view}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => view!,
  );
}
