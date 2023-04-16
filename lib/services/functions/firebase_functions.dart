import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';

class FirestoreServices {
  final log = Logger('FireStore Services class');

  static saveUser(
      String role,
      email,
      userName,
      fullName,
      phone,
      cellPhone,
      occupation,
      workplace,
      address,
      complementaryAddress,
      uid,
      bool privacy,
      activity) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'role': role,
      'activity': activity,
      'email': email,
      'userName': userName,
      'fullName': fullName,
      'privacy': privacy,
      'phone': phone,
      'cellPhone': cellPhone,
      'occupation': occupation,
      'workplace': workplace,
      'address': address,
      'complementayAddress': complementaryAddress
    });
    // .then(
    // (doc) => log.fine("User saved"),
    //onError: (e) => log.severe("Error updating FireStore $e"),
    //)
  }

  static deleteUser(String id, uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).delete();
    //.then(
    //(doc) => log.fine("User deleted"),
    //onError: (e) => log.severe("Error updating FireStore $e"),
    //);
  }
}
