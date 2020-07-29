
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageSelector{
  final picker = ImagePicker();
  Future<File> selectImage()async{
    PickedFile pickedFile =   await picker.getImage(source: ImageSource.gallery);
    return File(pickedFile.path);
  }
}