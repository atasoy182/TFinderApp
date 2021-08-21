import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:tfinder_app/services/storage_base.dart';

class FirebaseStorageService implements StorageBase {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Reference _storageRef;
  static UploadTask uploadTask;

  @override
  Future<String> uploadFile(
    String userID,
    String fileType,
    File yuklenecekDosya,
  ) async {
    String downloadUrl;
    if (fileType == "profil_foto") {
      _storageRef = _firebaseStorage.ref().child(userID).child(fileType).child("profil_photo.png");
    } else {
      _storageRef = _firebaseStorage.ref().child(userID).child(fileType).child("profil_video.mp4");
    }
    uploadTask = _storageRef.putFile(yuklenecekDosya);

    await uploadTask.then((TaskSnapshot taskSnapshot) async {
      print("task snap shot" + taskSnapshot.toString());

      downloadUrl = await taskSnapshot.ref.getDownloadURL();
    });

    return downloadUrl;
  }
}

// class FirebaseApi {
//   static UploadTask uploadFile(String currentUserID, String fileType,File file) {
//     try {
//       final ref = FirebaseStorage.instance.ref().child(currentUserID).child(fileType).child("profil_video.mp4");
//
//       return ref.putFile(file);
//     } on FirebaseException catch (e) {
//       return null;
//     }
//   }
//
// }
