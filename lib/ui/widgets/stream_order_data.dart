import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:cloud_firestore/cloud_firestore.dart';
// Screens
import '../screens/admin/order_screen.dart';
// Widgets
import '../widgets/list_cart_item.dart';
import '../widgets/column_count.dart';
// Providers
// Models
import '../../bloc/model/order.dart';
// Helpers
import '../../helpers/screen_helper.dart';
import '../../helpers/constants.dart';
//sevices
import '../../services/order_operation.dart';

class StreamOrderData extends StatelessWidget {
  OrderOperation _orderOperation = OrderOperation();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _orderOperation.loadOrders(),
        builder: (context, snapshot) {
          List<Order> _orders = [];
          if (snapshot.hasData) {
            _orders = _orderOperation.prepareOrders(snapshot: snapshot.data);
            return Column(
              children: <Widget>[
                ColumnCount(number: _orders.length.toString(),title: _orders.length>1 ? 'Orders':'Order',),
                Container(
                  height: ScreenHelper.screenHight(context, 485),
                  child: ListView.builder(
                    itemCount: _orders.length,
                    itemBuilder: (context, index) => ListCartItem(
                      title: _orders[index].orderDate.toString(),
                      subtitle: _orders[index].price,
                      trailing: ColumnCount(
                        title: 'Prducts',
                        number: _orders[index].products.length.toString(),
                        numberSize: 30.0,
                        titleSize: 10.0,
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed(OrderScreen.routeName,arguments: _orders[index]);
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

}
