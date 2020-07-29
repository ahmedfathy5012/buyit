import 'package:flutter/material.dart';
// Dart Packages
import 'dart:math';
import 'dart:io';
// Flutter packages
// Screens
// Widgets
import '../../widgets/column_count.dart';
import '../../widgets/status_column.dart';
import '../../widgets/outer_button.dart';
import '../../widgets/list_cart_item.dart';
// Providers
// Models
import '../../../bloc/model/order.dart';
// Helpers
import '../../../helpers/constants.dart';
import '../../../helpers/screen_helper.dart';
import '../../../helpers/dialog_helper.dart';
//sevices
import '../../../services/order_operation.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = 'OrderScreen';
  OrderOperation _orderOperation = OrderOperation();

  @override
  Widget build(BuildContext context) {
    Order _order = ModalRoute.of(context).settings.arguments as Order;
    print(_order.status.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Data',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: MAIN_COLOR,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenHelper.screenHight(context, 15.0)),
        child: _drawOrderScreen(context,_order),
      ),
    );
  }

  Widget _drawOrderScreen(BuildContext context , Order order) {
    return Column(
      children: <Widget>[
        _infoHeader(context ,order),
        SizedBox(height: ScreenHelper.screenHight(context,7.0),),
        Container(
          height: ScreenHelper.screenHight(context,400.0),
          color: Colors.transparent,
          child: ListView.builder(
              itemCount: order.products.length,
              itemBuilder: (context,index)=>ListCartItem(
                title: order.products[index].name,
                trailing: ColumnCount(
                  title: 'Units',
                  number: order.products[index].quantity.toString(),
                  numberSize: 30.0,
                  titleSize: 10.0,
                ),
                subtitle: 'Price Of This Product Is ${order.products[index].price}',
              ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OuterButton(title: 'Charged',ontap: (){
                if(order.status != "charged" && order.status != "arrived"){
                  _orderOperation.chargedOrder(order);
                  Navigator.pop(context);
                }

            },),
            OuterButton(title: 'Arrived',ontap: (){
              if(order.status != 'arrived'){
                _orderOperation.arrivedOrder(order);
                Navigator.pop(context);
              }
            },),
            OuterButton(title: 'Delete',ontap: (){},),
          ],
        ),
      ],
    );
  }

  Widget _infoHeader(BuildContext context , Order order) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ColumnCount(
              number: order.products.length.toString(),
              title: 'products',
            ),
            ColumnCount(
              number: order.price.toString(),
              title: 'LE',
            ),
            StatusColumn(
              status: 'Pending',
              date: order.status == 'pending' ? order.orderDate : order.status == 'charged' ? order.chargedAt : order.arrivedAt,
            ),

          ],
        ),
        SizedBox(
          height: ScreenHelper.screenHight(context, 5.0),
        ),
        OuterButton(
          title: 'Show User Info',
          ontap: () {
            DialogHelper.showAlertDialog(
                context: context,
                title: Text('User Info'),
                onOk: () {
                  Navigator.pop(context);
                },
                onCanncel: () {
                  Navigator.pop(context);
                },
                content: Container(
                  height: ScreenHelper.screenHight(context, 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Email : Fathy5012@gmail.com'),
                      SizedBox(height: ScreenHelper.screenHight(context,2.0),),
                      Divider(),
                      SizedBox(height: ScreenHelper.screenHight(context,2.0),),
                      Text('Address : Mahalla'),
                    ],
                  ),
                ));
          },
        ),
      ],
    );
  }
}
