import 'package:flutter/material.dart';
import 'package:ourpass_int/navigation/navigation_service.dart';
import 'package:ourpass_int/service_locator.dart';

class BaseViewModel extends ChangeNotifier {
  final navigation = inject<NavigationHandler>();

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }
}
