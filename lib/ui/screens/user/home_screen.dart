import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
import 'package:buyit/ui/screens/user/cart_screen.dart';
// Widgets
import '../../widgets/stream_data.dart';
import '../../widgets/cart_count.dart';
// Providers
// Models
// Helpers
import '../../../helpers/constants.dart';
import '../../../helpers/screen_helper.dart';
//sevices

class HomeScreen extends StatelessWidget {
  static String routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(
                indicatorColor: MAIN_COLOR,
                unselectedLabelColor: Colors.black26,
                labelColor: Colors.black,
                tabs: [
                  Tab(child: Text('cat1'),),
                  Tab(child: Text('cat2'),),
                  Tab(child: Text('cat3'),),
                ],
              ),
              title: Text('PRODUCTS',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right:ScreenHelper.screenWidth(context,10.0),top: ScreenHelper.screenHight(context,10.0) ),
                  child: CartCount(onTap: (){
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },),
                ),
              ],
            ),
            body: TabBarView(
              children: [
                StreamData(category: 'cat1',),
                StreamData(category: 'cat2',),
                StreamData(category: 'cat3',),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
