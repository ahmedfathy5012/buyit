import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';



class PushNotificationServices{

  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future initialise()async{
    if(Platform.isIOS){
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(


        onMessage: (Map<String,dynamic> message){
          print('onMessage : $message');
        },

        onLaunch:(Map<String,dynamic> message){
          print('onLaunch : $message');
        },

        onResume:  (Map<String,dynamic> message){
          print('onResume : $message');
        }

    );
    _fcm.subscribeToTopic('ADMIN');
  }

  Future<String> getDeviceToken()async{
    return await _fcm.getToken();
  }

  void subscribeTo(String topic){
    _fcm.subscribeToTopic(topic);
  }
}