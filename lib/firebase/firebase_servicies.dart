import 'package:firebase_database/firebase_database.dart';
import 'package:fresh_basket_mine/model/product_model.dart';
import '../model/app_user.dart';

class FirebaseService {
  // static final FirebaseService _instance = FirebaseService._internal();
  // //static final FirebaseService instance = FirebaseService();
  //
  // factory FirebaseService() {
  //   // factory constructor
  //   return _instance;
  // }
  //
  // FirebaseService._internal(); // named constructor

  // final FirebaseAuth _mAuth = FirebaseAuth.instance;

  // Future<dynamic> login(String email, String password) async {
  //   try {
  //     UserCredential credential = await _mAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //
  //     return credential;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       return 'No user found for that email.';
  //     } else if (e.code == 'wrong-password') {
  //       return 'Wrong password provided for that user.';
  //     }
  //   }
  // }

  // Future<dynamic> signUp(String email, String password) async {
  //   try {
  //     final credential = await _mAuth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return credential;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       return 'The password provided is too weak.';
  //     } else if (e.code == 'email-already-in-use') {
  //       return 'The account already exists for that email.';
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> signOut() async {
  //   return await _mAuth.signOut();
  // }

  //--------------------FirebaseDatabase------------------//

  final DatabaseReference _mRef =
      FirebaseDatabase.instance.ref(); // getting path of root node

  // insert data into firebase real time database
  Future<void> createUser(AppUser user) async {
    await _mRef.child('user-node').child(user.id!).set(user.toMap());
  }

  Future<Map?> getUser() async {
    Map? allData;

    await _mRef.child('user-node').get().then((value) {
      allData = value.value == null ? null : value.value as Map;
    });

    return allData;
  }

  //-------------------------------------------------------------


    Future<void> addProduct(GroceryProduct product)
    async {
     await _mRef.child('product-node').push().set(product.toJson());
    }

  Future<Map?> getProduct() async {
    Map? allData;

    await _mRef.child('product-node').get().then((value) {
      allData = value.value == null ? null : value.value as Map;
    });

    return allData;
  }


}
