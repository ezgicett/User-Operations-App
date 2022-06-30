import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';

class Firestore {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference _userRefer = FirebaseFirestore.instance.collection(
      'Person');


  Future<bool> addUser(UserModel user) async {
    try {
      await _userRefer.doc(user.uid).set(user.toJson());
      return true;
    } catch (e) {
      print('an error while adding user to firestore' + e.toString());
      return false;
    }
  }

  Future<void> updateGender( UserModel? user,String gender) async {

     await _userRefer.doc(user?.email).set({
        gender: gender,
      });
  }

  Future<bool> userExists(String email) async =>
      await _userRefer.where("email", isEqualTo: email).get().then((value) => value.size > 0 ? true : false);

  Future<bool> updateUser(String userid, UserModel updateduser) async {
    var query = await _userRefer.where('email', isEqualTo: updateduser.email)
        .get();
    if (query.docs.isNotEmpty && query.docs.first.id != userid) {
      print('username is already in use');
      return false;
    } else {
      await _userRefer.doc(userid).update(updateduser.toJson());
      return true;
    }
  }


  /*Future<UserModel?> findUser(String userId) async {
    var _doc = await _userRefer.doc(userId).get();
    if (_doc.exists) {
      var _usermap = _doc.data()!;
      return UserModel.fromJson(_usermap);
    } else {
      return null;
    }
  }*/
}