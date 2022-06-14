import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/modules/dashboard/modal/kicker_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('orders');

class FirebaseOrderDatabase {
  static String? userUid;

  Future<void> addPurchasedOrderToDB({required KickerModel kickerOrder}) async {
    userUid = userUid ?? FirebaseAuth.instance.currentUser?.uid;

    Map<String, dynamic> data = <String, dynamic>{
      "uid": userUid,
      "kickerPid": 2,
      "kickerImage": kickerOrder.kickerName,
      "kickerName": kickerOrder.kickerName,
      "kickerDescription": kickerOrder.kickerDescription,
      "kickerPrice": kickerOrder.kickerPrice,
      "kickerStars": kickerOrder.kickerStars,
      // "kickerColor": kickerOrder.kickerColor.toString(),
      // "kickerAvailableColors": kickerOrder.kickerAvailableColors.toString,
      "kickerSales": kickerOrder.kickerSales,
    };
    try {
      await _firestore.collection('orders').doc(userUid).set(data);
    } catch (e) {
      print(e);
    }
  }

  fetchAllOrdersOfUser() async {
    // CollectionReference orderCollection =
    //     _mainCollection.doc(userUid).collection('items');

    // return orderCollection.snapshots();

    DocumentSnapshot documentSnapshot =
        await _mainCollection.doc(userUid).get();
    print('read');
    print(jsonEncode(documentSnapshot));
  }
}
