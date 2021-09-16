import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class FirebaseHelper {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  // static FirebaseStorage storage = FirebaseStorage.instance;
  static Future<void> firebaseInit() async {
    await Firebase.initializeApp();
  }

  // static Future<String> uploadImage(String image, File imageFile) async {
  //   var ref = storage.ref('images/$image');
  //   UploadTask uploadTask = ref.putFile(
  //     imageFile,
  //   );
  //   await uploadTask.whenComplete(() {
  //     print('Download completed');
  //   });
  //   print('Url');
  //   return await ref.getDownloadURL();
  // }

  static Future setData(
      {@required String collectionName,
      @required Map<String, dynamic> body,
      @required String token}) async {
    return await fireStore.collection('collectionName').doc(token).set(body);
  }

  static Future sendMessage(
      {@required String senderId, @required String recieverID, Map data}) async {
    return await fireStore
        .collection('users')
        .doc(senderId.toString())
        .collection('chats')
        .doc(recieverID.toString())
        .collection('messages')
        .add(data)
        .then((value) {
      print('Data $value');
    });
  }

  // static Future setPost({@required Map<String, dynamic> body}) async
  // {
  //   return await fireStore
  //       .collection('posts')
  //       .doc(token)
  //       .collection('myPosts')
  //       .doc()
  //       .set(body);
  // }

  // static Future<DocumentSnapshot<Map<String, dynamic>>> getDataDoc(
  //     {required String collectionName, required String docId}) async {
  //   return await fireStore.collection(collectionName).doc(docId).get();
  // }
  static void getMessages({
    @required int senderId,
    @required int receiverId,
  })  {
      fireStore
        .collection('users')
        .doc(senderId.toString())
        .collection('chat')
        .doc(receiverId.toString())
        .collection('messages')
        .snapshots()
        .listen((event) {});
  }

  // static Future updateDataDoc(
  //     {required String collectionName,
  //     required String docId,
  //     required Map<String, dynamic> data}) async {
  //   return await fireStore.collection(collectionName).doc(docId).update(data);
  // }
}
