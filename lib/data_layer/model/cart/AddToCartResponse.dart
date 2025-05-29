/// cartItemId : 12
/// userId : "USR-5X79-0253"
/// productId : 1
/// productName : "Credit Card (Normal)"
/// productImage : "https://illventapp.azurewebsites.net/images/products/source/credit-card-normal.jpg"
/// productPrice : 150.00
/// quantity : 1
/// totalPrice : 150.00

class AddToCartResponse {
  AddToCartResponse({
      this.cartItemId, 
      this.userId, 
      this.productId, 
      this.productName, 
      this.productImage, 
      this.productPrice, 
      this.quantity, 
      this.totalPrice,});

  AddToCartResponse.fromJson(dynamic json) {
    cartItemId = json['cartItemId'];
    userId = json['userId'];
    productId = json['productId'];
    productName = json['productName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
  }
  int? cartItemId;
  String? userId;
  int? productId;
  String? productName;
  String? productImage;
  double? productPrice;
  int? quantity;
  double? totalPrice;
AddToCartResponse copyWith({  int? cartItemId,
  String? userId,
  int? productId,
  String? productName,
  String? productImage,
  double? productPrice,
  int? quantity,
  double? totalPrice,
}) => AddToCartResponse(  cartItemId: cartItemId ?? this.cartItemId,
  userId: userId ?? this.userId,
  productId: productId ?? this.productId,
  productName: productName ?? this.productName,
  productImage: productImage ?? this.productImage,
  productPrice: productPrice ?? this.productPrice,
  quantity: quantity ?? this.quantity,
  totalPrice: totalPrice ?? this.totalPrice,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cartItemId'] = cartItemId;
    map['userId'] = userId;
    map['productId'] = productId;
    map['productName'] = productName;
    map['productImage'] = productImage;
    map['productPrice'] = productPrice;
    map['quantity'] = quantity;
    map['totalPrice'] = totalPrice;
    return map;
  }

}