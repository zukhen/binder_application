import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final verificationId = ''.obs;
  final _firestore = FirebaseFirestore.instance;

  signUpWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    User? user = userCredential.user;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'Dob': '',
        'email': user.email,
        'fullName': user.displayName,
        'gender': '',
        'password': '',
        'phone': '',
      });
    }
    // final user = userCredential.user;
    // final userName = user?.displayName;
    // final userEmail = user?.email;
    // return '$userName|$userEmail';
  }

  createUserWithEmailAndPassWord(
      String email, String password, String fullName) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore.collection("users").add({
      "email": email,
      "password": password,
      "fullName": fullName,
      "gender": "",
      "Dob": "",
      "phone": "",
    }).then((value) {
      print("THANH CONG");
    }).catchError((error) {
      print("THAT BAI>>>>>>>>>>>>>>>>>>>>>>>>>>>$error");
    });
  }

  signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  getDataUser(String email) async {
    QuerySnapshot userSnapshot = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();

    if (userSnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = userSnapshot.docs[0];
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      // Lấy thông tin người dùng
      String phone = userData["phone"];
      return '$phone|${userDoc.id}';
    } else {
      print("Không tìm thấy người dùng với email: $email");
    }
  }

  updateUserData(String id, String gender, String dob, String phone) async {
    await _firestore.collection("users").doc(id).update({
      "gender": gender,
      "Dob": dob,
      "phone": phone,
    }).then((value) {
      print("Cập nhật dữ liệu thành công");
    }).catchError((error) {
      print("Lỗi khi cập nhật dữ liệu: $error");
    });
  }

  fogotPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  logOut() async {
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }

  phoneAuth(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (e) {},
      codeSent: (verificationId, resendToken) {
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$verificationId");
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  verifyOTP(String otp) async {
    final phoneAuthProvider = PhoneAuthProvider.credential(
      verificationId: verificationId.value,
      smsCode: otp,
    );
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$verificationId");

    final credentials =
        await _firebaseAuth.signInWithCredential(phoneAuthProvider);
    return credentials.user != null ? true : false;
  }
}
