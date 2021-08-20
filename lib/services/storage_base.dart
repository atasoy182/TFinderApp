import 'dart:io';

abstract class StorageBase {
  Future<String> uploadFile(String UserID, String fileType, File yuklenecekDosya);
}
