import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// Screens
// Widgets
import '../ui/widgets/origin_text_field.dart';
import '../ui/widgets/used_button.dart';
// Providers
import '../bloc/provider/cart_provider.dart';
// Models
import '../bloc/model/product.dart';
import '../bloc/model/order.dart';
// Helpers
import '../helpers/constants.dart';
import '../helpers/screen_helper.dart';
import '../helpers/dialog_helper.dart';
//services
import 'auth.dart';

class CartOperations {

  final Firestore _firestore = Firestore.instance;
  final Auth _auth = Auth();



  addOrder(var _order) {
    _firestore.collection(ORDER_COLLECTION).add(_order.toMap());
  }

  void submitOrder(BuildContext context , List<Product> _products)async{
    GoogleMapController mapController;

    final LatLng _center = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    if(_products.length > 0){
      var userData =  await _auth.getUser();
      String address;
      double _price = this.getOrderPrice(_products);
      DialogHelper.showAlertDialog(
          context: context ,
          title: Text('Yor Order Price is \$$_price'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              UsedButton(
                title: 'Map',
                onPressed: (){
                  DialogHelper.showAlertDialog(
                    context: context,
                    title: Text('Choose Your Location'),
                    content: Container(
                      height: 100.0,
                      width: 100.0,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 11.0,
                        ),
                      ),
                    ),
                  );
                },
                buttonColor: Colors.transparent,
                textColor: MAIN_COLOR,
                sideColor: MAIN_COLOR,
              ),
              UsedButton(
                title: 'Current Location',
                onPressed: (){},
                buttonColor: MAIN_COLOR,
              ),
            ],
          ),

//          OriginTextField(onChange: (text){
//            address = text;
//          },),
          onCanncel: (){
            Navigator.pop(context);
          },
          onOk: (){
            this.prepareOrder(address: address , orderPrice: _price.toString() ,products: _products,userData: userData);
            Provider.of<CartProvider>(context,listen: false).resetProducts();
            Navigator.pop(context);
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('This Cart Has Been Added')));
          }
      );
    }
    print('empty');
  }

  double getOrderPrice(List<Product> products) {
    double price=0.0;
    for (Product product in products) {
      price += product.quantity * double.parse(product.price);
    }
    return price;
  }

  prepareOrder({String address , String orderPrice,List<Product> products , var userData}){
    Order _order = Order(
      price: orderPrice,
      address: address,
      userId: userData.uid.toString(),
      userEmail: userData.email.toString(),
      status: 'pending',
      products: products,
    );
    this.addOrder(_order);
  }

}
/*
pending
charged
arrived
*/
