import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:ourpass_int/models/user_weight_model.dart';
import 'package:ourpass_int/utils/exception.dart';

class UserDataBase {
  final _auth = FirebaseAuth.instance;
  CollectionReference weightCollection =
      FirebaseFirestore.instance.collection('weight');

  StreamController<List<UserWeightModel>> _weightController =
      StreamController<List<UserWeightModel>>.broadcast();

  Future register(
      {String? collection,
      String? document,
      Map<String, dynamic>? data}) async {
    try {
      final register = weightCollection;
      register.add(data!);
    } catch (e) {
      throw CustomException(errorMessage: "Unknown Error");
    }
  }

  Future<void> registerUserWeight(UserWeightModel weightModel) async {
    await register(data: weightModel.toMap());
  }

  Future<void> deleteEntry(String documentId) async {
    await weightCollection.doc(documentId).delete();
  }

  Stream fetchUserWeights() {
    weightCollection
        .where('userId', isEqualTo: _auth.currentUser!.uid)
        .snapshots()
        .listen((event) {
      if (event.docs.isNotEmpty) {
        var weights = event.docs.map((weight) {
          return UserWeightModel.fromMap(
              weight.data() as Map<String, dynamic>, weight.id);
        }).toList();
        _weightController.add(weights);
      }
    });
    return _weightController.stream;
  }

  // Future<UserWeightModel> fetchAllUserWeight() async {

  //   final allUserWeight = await fetch();
  // }
}
