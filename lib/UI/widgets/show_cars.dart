import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rally_pedia_app/firestore/firestore_helper.dart';

class CarsShow extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Cars().getCloudFirestoreUsers();

    return Container(
      child: Text("runnning tests"),
    );
  }
}
