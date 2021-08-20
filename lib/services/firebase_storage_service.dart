import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:tfinder_app/services/storage_base.dart';

class FirebaseStorageService implements StorageBase {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Reference _storageRef;

  @override
  Future<String> uploadFile(String userID, String fileType, File yuklenecekDosya) async {
    String downloadUrl;
    _storageRef = _firebaseStorage.ref().child(userID).child(fileType).child("profil_photo.png");
    UploadTask _uploadTask = _storageRef.putFile(yuklenecekDosya);

    await _uploadTask.then((TaskSnapshot taskSnapshot) async {
      print("task snap shot" + taskSnapshot.toString());

      downloadUrl = await taskSnapshot.ref.getDownloadURL();
    });

    return downloadUrl;
  }
}
