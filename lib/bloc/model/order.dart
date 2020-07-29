import 'product.dart';
import '../../services/auth.dart';
class Order{
  String id=null;
  String price;
  String address;
  String userEmail;
  String userId;
  String orderDate;
  String status;
  String chargedAt='';
  String arrivedAt='';
  List<Product> products;

  Order({this.id,this.address,this.price,this.products,this.userEmail,this.userId,this.orderDate,this.status,this.arrivedAt,this.chargedAt});

  Order.fromJson(var document){
    Map<String,dynamic> jsonObject = document.data;
    //print(jsonObject['products'][0]['productQuantity'].toString());
    //print(jsonObject['products'][0]['productDescription']);
    this.id=document.documentID;
    this.address=jsonObject['clientAddress'] == null ? ' ' : jsonObject['clientAddress'];
    this.orderDate=jsonObject['orderDate'];
    this.price=jsonObject['orderPrice'] == null ? ' ' : jsonObject['orderPrice'];
    this.status=jsonObject['orderstatus'] == null ? ' ' : jsonObject['orderstatus'];
    this.userEmail=jsonObject['userEmail'] == null ? ' ' : jsonObject['userEmail'].toString();
    this.userId=jsonObject['userId'] == null ? ' ' : jsonObject['userId'];
    this.chargedAt=jsonObject['chargedAt'] == null ? ' ' : jsonObject['chargedAt'].toString();
    this.arrivedAt=jsonObject['arrivedAt'] == null ? ' ' : jsonObject['arrivedAt'].toString();
    this.status=jsonObject['status'] == null ? ' ' : jsonObject['status'].toString();
    this.products=[];
    if(jsonObject['products'] != null){
      _setProduct(jsonObject['products']);
      }else{}
  }


  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    if (id != null) {
      map['poductId'] = id;
    }
    map['clientAddress']=address;
    map['orderDate']=DateTime.now().toString();
    map['orderPrice']=price;
    map['userId']=userId;
    map['userEmail']=userEmail;
    map['status']=status;
    map['arrivedAt']=arrivedAt;
    map['chargedAt']=chargedAt;
    map['products']=_mapProducts();
    return map;
  }



    void _setProduct(List productsData){
      if(productsData.length>0){
        for(var item in productsData){
          if(item != null){

           products.add(Product.fromJson(jsonObject: item));
          }
        }
      }
    }


   List _mapProducts(){
      List _productList = [];
      for(Product product in this.products){
        _productList.add(product.toMap());
      }
      return _productList;
    }

}