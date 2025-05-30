/// orderItemId : 12
/// orderId : 15
/// productId : 2
/// productName : "Credit Card (Premium)"
/// productImage : "https://illventapp.azurewebsites.net/images/products/source/credit-card-premium.jpg"
/// quantity : 1
/// unitPrice : 350.00
/// totalPrice : 350.00

class OrderItems {
  OrderItems({
      this.orderItemId, 
      this.orderId, 
      this.productId, 
      this.productName, 
      this.productImage, 
      this.quantity, 
      this.unitPrice, 
      this.totalPrice,});

  OrderItems.fromJson(dynamic json) {
    orderItemId = json['orderItemId'];
    orderId = json['orderId'];
    productId = json['productId'];
    productName = json['productName'];
    productImage = json['productImage'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    totalPrice = json['totalPrice'];
  }
  int? orderItemId;
  int? orderId;
  int? productId;
  String? productName;
  String? productImage;
  int? quantity;
  double? unitPrice;
  double? totalPrice;
OrderItems copyWith({  int? orderItemId,
  int? orderId,
  int? productId,
  String? productName,
  String? productImage,
  int? quantity,
  double? unitPrice,
  double? totalPrice,
}) => OrderItems(  orderItemId: orderItemId ?? this.orderItemId,
  orderId: orderId ?? this.orderId,
  productId: productId ?? this.productId,
  productName: productName ?? this.productName,
  productImage: productImage ?? this.productImage,
  quantity: quantity ?? this.quantity,
  unitPrice: unitPrice ?? this.unitPrice,
  totalPrice: totalPrice ?? this.totalPrice,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderItemId'] = orderItemId;
    map['orderId'] = orderId;
    map['productId'] = productId;
    map['productName'] = productName;
    map['productImage'] = productImage;
    map['quantity'] = quantity;
    map['unitPrice'] = unitPrice;
    map['totalPrice'] = totalPrice;
    return map;
  }

}