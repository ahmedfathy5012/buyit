import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
import 'package:buyit/ui/screens/admin/add_product_screen.dart';
import 'package:buyit/ui/screens/user/product_screen.dart';
// Widgets
import 'my_poup_menu_item.dart';
// Providers
// Models
// Helpers
import '../../helpers/screen_helper.dart';
// services
import '../../services/product_operations.dart';


class GridItem extends StatelessWidget {
  ProductOperations _productOperations = ProductOperations();
  final List products;
  final int index;
  final bool isAdmin;

   GridItem({this.products, this.index, this.isAdmin=false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details)async{
        if(isAdmin == false){
            print('user Mode');
           Navigator.of(context).pushNamed(
           ProductScreen.routeName,
           arguments: products[index]);
        }else{
          double dx = details.globalPosition.dx;
        double dy = details.globalPosition.dy;
        double dx2 = MediaQuery.of(context).size.width - dx;
        double dy2 = MediaQuery.of(context).size.height - dy;
        await showMenu(context: context,
            position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
            items: [
              MyPopupMenuItem(
                child: Text('Edit'),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(
                    AddProductScreen.routeName,
                    arguments: products[index]
                  );
                },
              ),
              MyPopupMenuItem(
                child: Text('Delete'),
                onTap: (){
                  Navigator.pop(context);
                  _productOperations.deletProduct(products[index].id);
                },
              ),
            ]
        );
        }
      },
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Image(
                  image: AssetImage('assets/images/jacket.jpg'),
              ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: ScreenHelper.screenHight(context, 40.0),
              color: Colors.white70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${products[index].name}'),
                  Text('\$${products[index].price}')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
