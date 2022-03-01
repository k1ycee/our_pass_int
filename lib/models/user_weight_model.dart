import 'dart:convert';


class UserWeightModel {
  final String? day;
  final double? weight;
  final String? userId;
  final String? documentId;

  UserWeightModel({this.day, this.weight, this.userId, this.documentId});

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'weight': weight,
      'userId': userId
    };
  }

  factory UserWeightModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserWeightModel(
      day: map['day'],
      weight: map['weight']?.toDouble(),
      documentId: documentId,
    );
  }
}
