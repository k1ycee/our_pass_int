import 'package:firebase_auth/firebase_auth.dart';
import 'package:ourpass_int/constants/routes.dart';
import 'package:ourpass_int/models/user_weight_model.dart';
import 'package:ourpass_int/presentation/view_models/base_vm.dart';
import 'package:ourpass_int/services/auth/user_auth.dart';
import 'package:ourpass_int/services/db/user_database.dart';

import '../../service_locator.dart';

class UserViewModel extends BaseViewModel {
  final userAuth = inject<UserAuthentication>();
  final userDb = inject<UserDataBase>();

  List<UserWeightModel> _userWeights = [];
  List<UserWeightModel> get userWeights => _userWeights;

  void signInAnonymously() async {
    setBusy(true);
    await userAuth.signUpAnonymously();
    setBusy(false);
    navigation.pushNamed(Routes.ViewWeightRoute);
    notifyListeners();
  }

  void registerUserWeight(UserWeightModel weightModel) async {
    setBusy(true);
    await userDb.registerUserWeight(weightModel);
    fetchAllWeights();
    setBusy(false);
    navigation.pushNamed(Routes.ViewWeightRoute);
    notifyListeners();
  }

  void fetchAllWeights() {
    setBusy(true);
    userDb.fetchUserWeights().listen((weights) {
      _userWeights = weights!;
      notifyListeners();
      setBusy(false);
    });
    
  }

  void delete(String documentId) async {
    await userDb.deleteEntry(documentId);
    notifyListeners();
  }

  void signOut() async {
    setBusy(true);
    await userAuth.signOut();
    setBusy(false);
    navigation.exitApp();
    notifyListeners();
  }
}
