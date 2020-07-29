import 'package:flutter/foundation.dart';
import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';

import '../bloc/model/cloud_storage_Result.dart';

class CloudStorageService {
  Future<CloudStorageResult> uploadImage(
      {@required File imageToUpload, @required String title}) async {
    var imageFileName =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child("images").child(imageFileName);

    StorageUploadTask uploadTask = storageReference.putFile(imageToUpload);

    await uploadTask.onComplete;

    var downloadUrl = await storageReference.getDownloadURL();

    if (uploadTask.isComplete) {
      String url = downloadUrl.toString();
      print('my url my url my url $url');
      return CloudStorageResult(imageUrl: url, imageFileName: imageFileName);

    }
    return null;
  }
}
