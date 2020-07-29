import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FacebookAuth {
  FacebookLogin _facebookLogin = FacebookLogin();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<int> signInWithFacebook() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    switch(result.status){
      case FacebookLoginStatus.loggedIn:
        final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token
        );
        _firebaseAuth.signInWithCredential(credential);
        return 1;
        break;
      case FacebookLoginStatus.cancelledByUser:
        return 0;
        break;
      case FacebookLoginStatus.error:
        return -1;
        break;
    }
  }

  signOutFacebook(){
    _facebookLogin.logOut();
  }
}