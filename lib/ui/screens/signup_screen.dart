import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
// Screens
import 'login_screen.dart';
import 'package:buyit/ui/screens/user/home_screen.dart';
// Widgets
import '../widgets/text_field_block.dart';
import '../widgets/used_button.dart';
import '../widgets/logo.dart';
// Providers
import '../../bloc/provider/modal_hud.dart';
// Models
// Helpers
import '../../helpers/constants.dart';
import '../../helpers/screen_helper.dart';
//sevices
import '../../services/auth.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = 'SignupScreen';

  String _name, _email, _password;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final Auth _auth = Auth();
  var modalProvideData;

  void submit(context) async {
    modalProvideData.changeIsLoading(true);
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      try {
        await _auth.signUp(_email, _password);
        modalProvideData.changeIsLoading(false);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } catch (e) {
        modalProvideData.changeIsLoading(false);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    }
    modalProvideData.changeIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    modalProvideData = Provider.of<ModalHud>(context);
    return ModalProgressHUD(
      inAsyncCall: modalProvideData.isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MAIN_COLOR,
        body: Form(
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
                  hint: 'Enter Your Name',
                  icon: Icons.lock,
                  errorMessage: 'Please Enter Your Name',
                  onSaved: (value) {
                    _name = value;
                  },
                ),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 10.0)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 25.0)),
                child: TextFieldBlock(
                  hint: 'Enter Your Email',
                  icon: Icons.email,
                  errorMessage: 'Please Enter Your Email',
                  onSaved: (value) {
                    _email = value;
                  },
                ),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 10.0)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 25.0)),
                child: TextFieldBlock(
                  hint: 'Enter Your Password',
                  icon: Icons.lock,
                  errorMessage: 'Please Enter Your Password',
                  onSaved: (value) {
                    _password = value;
                  },
                ),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 30.0)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 130.0)),
                child: Builder(
                    builder: (context) => UsedButton(
                        title: 'Signup',
                        onPressed: () {
                          submit(context);
                        })),
              ),
              SizedBox(height: ScreenHelper.screenHight(context, 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Do have an account ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenHelper.screenFont(context, 16.0)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenHelper.screenFont(context, 16.0)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
