import 'package:cloud_firestore/cloud_firestore.dart';

class ClientProfileAuth {
  final _firestore = FirebaseFirestore.instance;

  getFullName(String email) async {
    QuerySnapshot userSnapshot = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
    if (userSnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = userSnapshot.docs[0];
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      // Lấy thông tin người dùng
      String fullName = userData["fullName"];
      return '$fullName|${userDoc.id}';
    } else {
      print("Không tìm thấy người dùng với email: $email");
    }
  }

  getFullData(String email) async {
    QuerySnapshot userSnapshot = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
    if (userSnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = userSnapshot.docs[0];
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      
      return userData;
    } else {
      print("Không tìm thấy người dùng với email: $email");
    }
  }
}
