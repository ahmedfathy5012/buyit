import 'package:flutter/material.dart';
import '../../services/push_notification_services.dart';


class Notifications extends StatefulWidget {
  static String routeName = 'Notification';
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  PushNotificationServices _notificationServices = PushNotificationServices();

  void notificationInit()async{
    await  _notificationServices.initialise();
    String token = await _notificationServices.getDeviceToken();
    print(token);
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    notificationInit();
   // _notificationServices.subscribeTo('ADMIN');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
