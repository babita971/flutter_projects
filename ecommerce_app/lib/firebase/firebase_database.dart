import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/modules/dashboard/modal/kicker_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection =
    _firestore.collection('order_history');

class FirebaseOrderDatabase {
  static String? userUid;

  Future<void> addPurchasedOrderToDB({required KickerModel kickerOrder}) async {
    userUid = userUid ?? FirebaseAuth.instance.currentUser?.uid;
 
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('history').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "kickerPid": kickerOrder.kickerPid,
      // "kickerImage": kickerOrder.kickerImage,
      // "kickerName": kickerOrder.kickerName,
      // "kickerDescription": kickerOrder.kickerDescription,
      // "kickerPrice": kickerOrder.kickerPrice,
      // "kickerStars": kickerOrder.kickerStars,
      // "kickerSales": kickerOrder.kickerSales,
      "orderTime": DateTime.now()
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("order added to the database"))
        .catchError((e) => print(e));
  }

  Stream<QuerySnapshot> fetchAllOrdersOfUser() {
    CollectionReference orderCollection =
        _mainCollection.doc(userUid).collection('history');
    return orderCollection.snapshots();
  }
}
