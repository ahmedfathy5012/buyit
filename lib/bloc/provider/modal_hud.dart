import 'package:flutter/cupertino.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
//sevices


class ModalHud extends ChangeNotifier{
  bool isLoading = false;

  void changeIsLoading(bool vlaue){
    isLoading = vlaue;
    notifyListeners();
  }
}