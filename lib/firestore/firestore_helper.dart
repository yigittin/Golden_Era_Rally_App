import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cars {
  final firestoreInstance = FirebaseFirestore.instance;

  Future<dynamic> getCloudFirestoreUsers() async {
    print("getCloudFirestore");

    //assumes you have a collection called "users"
    firestoreInstance.collection("Cars").get().then((querySnapshot) {
      //print(querySnapshot);
      querySnapshot.docs.forEach((value) {
        //print("Cars: results: value");
        //print(value.data());
      });
    }).catchError((onError) {
      //print("getCloudFirestoreCars: ERROR");
      //print(onError);
    });
  }
}
