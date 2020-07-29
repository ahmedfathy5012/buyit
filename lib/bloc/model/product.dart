

class Product{
  String id=null;
  String name;
  String description;
  String category;
  String location;
  String price;
  int quantity=0;

  Product({this.id,this.name,this.description,this.category,this.location,this.price='0',this.quantity=1});

  Product.fromJson({Map<String,dynamic> jsonObject , String documentID}){
    //Map<String,dynamic> jsonObject = document.data;
    this.id=documentID;
    this.name=jsonObject['productName'] == null ? ' ' : jsonObject['productName'];
    this.description=jsonObject['productDescription'] == null ? ' ' : jsonObject['productDescription'];
    this.category=jsonObject['productCategory'] == null ? ' ' : jsonObject['productCategory'];
    this.location=jsonObject['productLocation'] == null ? ' ' : jsonObject['productLocation'];
    this.price=jsonObject['productPrice'] == null ? ' ' : jsonObject['productPrice'];
    if(jsonObject['productQuantity'] !=null)
      this.quantity=jsonObject['productQuantity'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['poductId'] = id;
    }
    map['productName'] = name;
    map['productDescription'] = description;
    map['productCategory'] = category;
    map['productLocation'] = location;
    map['productPrice'] = price;
    if(quantity>0)
     map['productQuantity'] = quantity;
    return map;
  }
}