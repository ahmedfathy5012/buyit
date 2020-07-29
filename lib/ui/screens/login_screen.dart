import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
// Screens
import 'signup_screen.dart';
import 'package:buyit/ui/screens/user/home_screen.dart';
import 'package:buyit/ui/screens/admin/admin_screen.dart';
// Widgets
import '../widgets/text_field_block.dart';
import '../widgets/used_button.dart';
import '../widgets/logo.dart';
// Providers
import '../../bloc/provider/modal_hud.dart';
import '../../bloc/provider/admin_mode.dart';
// Models
// Helpers
import '../../helpers/constants.dart';
import '../../helpers/screen_helper.dart';
//sevices
import '../../services/auth.dart';
import '../../services/google_auth.dart';
import '../../services/facebook_auth.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';
  String _email, _password;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final Auth _auth = Auth();
  final GoogleAuth _googleAuth = GoogleAuth();
  final FacebookAuth _facebookAuth = FacebookAuth();
  final String adminPassword = 'admin1234';
  var modalProvideData;
  var adminProviderData;

  @override
  Widget build(BuildContext context) {
    modalProvideData = Provider.of<ModalHud>(context);
    adminProviderData = Provider.of<AdminMode>(context);
    return Scaffold(
      backgroundColor: MAIN_COLOR,
      body: ModalProgressHUD(
        inAsyncCall: modalProvideData.isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenHelper.screenHight(context, 100.0)),
                  child: Logo()),
              SizedBox(height: ScreenHelper.screenHight(context, 80.0)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 25.0)),
                child: TextFieldBlock(
                    hint: 'Enter Your Email',
                    icon: Icons.email,
                    errorMessage: 'Please Enter Your Email',
                    onSaved: (value) {
                      _email = value;
                    }),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 10.0)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 25.0)),
                child: TextFieldBlock(
                    hint: 'Enter Your Password',
                    icon: Icons.lock,
                    isSecure: true,
                    errorMessage: 'Please Enter Your Password',
                    onSaved: (value) {
                      _password = value;
                    }),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 30.0)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 130.0)),
                child: Builder(
                    builder: (context) => UsedButton(
                          title: 'Login',
                          onPressed: () {
                            submit(context);
                          },
                        )),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 10.0)),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 50.0)),
                child: SignInButton(Buttons.Google,onPressed: (){
                  signInWithGoogle(context);
                }),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 10.0)),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 50.0)),
                child: SignInButton(Buttons.Google, onPressed: (){
                  _googleAuth.signOutGoogle();
                }),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 10.0)),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 50.0)),
                child: SignInButton(Buttons.Facebook, onPressed: (){
                  signInWithFacebook(context);
                }),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 10.0)),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context, 50.0)),
                child: SignInButton(Buttons.Facebook, onPressed: (){
                   _facebookAuth.signOutFacebook();
                }),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenHelper.screenFont(context, 16.0)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenHelper.screenFont(context, 16.0)),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 45),
                    vertical: ScreenHelper.screenHight(context, 10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        adminProviderData.changeIsAdmin(true);
                      },
                      child: Text(
                        'I\'m an admin',
                        style: TextStyle(
                            color: adminProviderData.isAdmin
                                ? MAIN_COLOR
                                : Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        adminProviderData.changeIsAdmin(false);
                      },
                      child: Text(
                        'I\'m a user',
                        style: TextStyle(
                            color: adminProviderData.isAdmin
                                ? Colors.white
                                : MAIN_COLOR),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) async {
    modalProvideData.changeIsLoading(true);
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      if (adminProviderData.isAdmin) {
        if (_password == adminPassword) {
          try {
            await _auth.signIn(_email, _password);
            modalProvideData.changeIsLoading(false);
            Navigator.pushReplacementNamed(context, AdminScreen.routeName);
          } catch (e) {
            modalProvideData.changeIsLoading(false);
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(e.message.toString())));
          }
        } else {
          modalProvideData.changeIsLoading(false);
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('something went wrong')));
        }
      } else {
        try {
          await _auth.signIn(_email, _password);
          modalProvideData.changeIsLoading(false);
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } catch (e) {
          modalProvideData.changeIsLoading(false);
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(e.message.toString())));
        }
      }
    }
    modalProvideData.changeIsLoading(false);
  }

  signInWithGoogle(BuildContext context)async{
    await _googleAuth.signInWithGoogle();
    //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  signInWithFacebook(BuildContext context)async{
   int result = await _facebookAuth.signInWithFacebook();
   print(result.toString());
    //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
