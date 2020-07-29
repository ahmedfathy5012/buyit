import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:provider/provider.dart';
// Screens
import 'cart_screen.dart';
// Widgets
import '../../widgets/large_button.dart';
import '../../widgets/cart_count.dart';

// Providers
import '../../../bloc/provider/cart_provider.dart';
// Models
import '../../../bloc/model/product.dart';
// Helpers
import '../../../helpers/constants.dart';
import '../../../helpers/screen_helper.dart';
//sevices



class ProductScreen extends StatelessWidget {
  static String routeName = 'ProductScreen';
  @override
  Widget build(BuildContext context) {
    Product _product = ModalRoute.of(context).settings.arguments as Product;
    var cartProviderData = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(image: AssetImage('assets/images/jacket.jpg'),fit: BoxFit.fill,),
          ),



          Positioned(
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: ScreenHelper.screenHight(context,70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:(){
                    Navigator.pop(context);
                  }),
                  Padding(
                    padding: EdgeInsets.only(top:ScreenHelper.screenHight(context,7.0) ,right: ScreenHelper.screenWidth(context,10.0)),
                    child: CartCount(onTap: (){
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },),
                  ),
                ],
              ),
            ),
          ),



          Positioned(
            bottom: 0,
            child: Column(
              children: <Widget>[
               Container(
                    width: MediaQuery.of(context).size.width,
                    height: ScreenHelper.screenHight(context,170.0),
                    color: Colors.white24,
                    child: Padding(
                      padding: EdgeInsets.all(ScreenHelper.screenWidth(context,20.0),),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Text('${_product.name}',style: TextStyle(fontSize: ScreenHelper.screenFont(context,20.0),fontWeight: FontWeight.bold),),
                           SizedBox(height: ScreenHelper.screenHight(context,10.0),),
                           Text('${_product.description}',style: TextStyle(fontSize: ScreenHelper.screenFont(context,10.0),fontWeight: FontWeight.bold),),
                           SizedBox(height: ScreenHelper.screenHight(context,10.0),),
                           Text('\$${_product.price}',style: TextStyle(fontSize: ScreenHelper.screenFont(context,16.0),fontWeight: FontWeight.bold),),
                           Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                   ClipOval(
                                   child: Material(
                                    color: MAIN_COLOR,
                                    child: GestureDetector(
                                         onTap: (){
                                              cartProviderData.increaseOrderCount();
                                         },                                      
                                          child: SizedBox(
                                            child: Icon(Icons.add),
                                            height: ScreenHelper.screenHight(context,32),
                                            width: ScreenHelper.screenHight(context,32),
                                          )                         
                                       ),
                                    ),
                                  ) ,
                                   SizedBox(width: ScreenHelper.screenWidth(context,10.0),),
                                   Text('${cartProviderData.orderCount}',style: TextStyle(fontSize: ScreenHelper.screenFont(context,50.0),fontWeight: FontWeight.bold),),
                                  SizedBox(width: ScreenHelper.screenWidth(context,10.0),),
                                  ClipOval(
                                   child: Material(
                                    color: MAIN_COLOR,
                                    child: GestureDetector(
                                         onTap: (){
                                             cartProviderData.decreaseOrderCount();
                                         },                                      
                                          child: SizedBox(
                                            child: Icon(Icons.remove),
                                            height: ScreenHelper.screenHight(context,32),
                                            width: ScreenHelper.screenHight(context,32),
                                          )                         
                                       ),
                                    ),
                                  ) ,
                               ],
                             ),
                        ],
                      ),
                      ),
                    ),
                Builder(
                  builder: (context)=> LargeButton(title: 'Add To Cart',onTap:(){
                    addToCart(context,_product,cartProviderData);
                  },),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  void addToCart(BuildContext context,Product _product , CartProvider cartProviderData){
    _product.quantity=cartProviderData.orderCount;
    cartProviderData.addToCart(_product);
    cartProviderData.resetOrderCount();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Success')));
  }
}