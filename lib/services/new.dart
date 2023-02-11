// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('details');

class DatabaseHarsh {
  final String? uid;

  DatabaseHarsh({this.uid});

//ADD FUNCTION
  static Future<void> addItem({
    required String fullname,
    required String bio,
    required String phone,
    required String email,
    required String age,
    required String city,
    required String state,
    required String project1name,
    required String project2name,
    required String project3name,
    required String project1desc,
    required String project2desc,
    required String project3desc,
    required String skill1,
    required String skill2,
    required String skill3,
    required String skill4,
    required String language1,
    required String language2,
    required String language3,
    required String language4,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(phone);
    Map<String, dynamic> data = <String, dynamic>{
      'fullname': fullname,
      'bio': bio,
      'phone': phone,
      'email': email,
      'age': age,
      'city': city,
      'state': state,
      'project1name': project1name,
      'project2name': project2name,
      'project3name': project3name,
      'project1desc': project1desc,
      'project2desc': project2desc,
      'project3desc': project3desc,
      'skill1': skill1,
      'skill2': skill2,
      'skill3': skill3,
      'skill4': skill4,
      'language1': language1,
      'language2': language2,
      'language3': language3,
      'language4': language4,
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Details added successfully!"))
        .catchError((e) => print(e));
  }
}
