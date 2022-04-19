import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DbProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List allDatas = [];
  List<dynamic> allIds = [];
  List completed = [];
  bool isAdd = false;
  
  Future writeToDb(String title, String more) async {
    firestore.collection('todos').add(
      {
        "check": false,
        "more": more,
        "title": title,
      },
    ).then((value) {
      debugPrint("Bazaga yozildi");
      notifyListeners();
    }).onError((error, stackTrace) {
      debugPrint("Error $error");
    });

    isAdd = true;
    notifyListeners();
  }

  Future readFromDb() async {
    allDatas.clear();
    allIds.clear();
    try {
      var data = await firestore.collection('todos').get();
      for (var i = 0; i < data.docs.length; i++) {
        allDatas.add(data.docs[i]);
        allIds.add(data.docs[i].id.toString());
      }
      print(allDatas[0]['title']);
      print(allIds[1]);
      notifyListeners();
    } catch (e) {
      debugPrint("Error $e");
    }
  }

  Future gener() async {
    var data1 = await firestore.collection('todos').get();
    completed =
        List.generate(data1.docs.length, (index) => data1.docs[index]['check']);
    notifyListeners();
  }

  Future disMis() async {
    var data2 = await firestore.collection('todos').get();
    allDatas = List.generate(data2.docs.length, (index) => data2.docs[index]);
    notifyListeners();
  }

  Future checkDb(int index) async {
    await firestore.collection('todos').doc("${allIds[index]}").set(
      {"check": completed[index] = !completed[index]},
      SetOptions(merge: true),
    );
    notifyListeners();
    print(completed);
    print("ozgardi");
  }

  Future delete(int index) async {
    await firestore.collection('todos').doc("${allIds[index]}").delete();
    notifyListeners();
  }
}
