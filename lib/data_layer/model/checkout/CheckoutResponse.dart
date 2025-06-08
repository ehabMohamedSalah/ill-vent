import 'OrderItems.dart';

/// orderId : 40
/// checkoutUrl : "https://checkout.stripe.com/c/pay/cs_test_b1NqLk7rHASDaCh4ZTSvR5i8i2vi0hbHOzL5FJujRZHsqgtii2vctL8tWD#fidkdWxOYHwnPyd1blpxYHZxWjA0V05WcD1UNn9gdkNTQ1RWMUhcfT03ZmhUQWNgQnZ2VFBUa1J8Tzx9XXdiU0dLRzFvdkJRVV1kV0dhV1VMRmxkXWtPV0Fjc2xzYm1pZFNRdE9QMDVpMVBqNTVTVldiaTJ3cycpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPydocGlxbFpscWBoJyknYGtkZ2lgVWlkZmBtamlhYHd2Jz9xd3BgeCUl"
/// userId : "USR-5X79-0253"
/// orderDate : "2025-06-08T09:43:11.8513334Z"
/// totalAmount : 185.00
/// paymentMethod : "card"
/// paymentStatus : "Pending"
/// message : "No cart items found for checkout"
/// shippingAddress : "12 St,nasser city"
/// shippingCost : 35
/// orderStatus : "Pending"
/// orderItems : [{"orderItemId":41,"orderId":40,"productId":1,"productName":"Credit Card (Normal)","productImage":"https://illventapp.azurewebsites.net/images/products/source/credit-card-normal.jpg","quantity":1,"unitPrice":150.00,"totalPrice":150.00}]

class CheckoutResponse {
  CheckoutResponse({
      this.orderId, 
      this.checkoutUrl, 
      this.userId, 
      this.orderDate, 
      this.totalAmount, 
      this.paymentMethod, 
      this.paymentStatus, 
      this.message, 
      this.shippingAddress, 
      this.shippingCost, 
      this.orderStatus, 
      this.orderItems,});

  CheckoutResponse.fromJson(dynamic json) {
    orderId = json['orderId'];
    checkoutUrl = json['checkoutUrl'];
    userId = json['userId'];
    orderDate = json['orderDate'];
    totalAmount = json['totalAmount'];
    paymentMethod = json['paymentMethod'];
    paymentStatus = json['paymentStatus'];
    message = json['message'];
    shippingAddress = json['shippingAddress'];
    shippingCost = json['shippingCost'];
    orderStatus = json['orderStatus'];
    if (json['orderItems'] != null) {
      orderItems = [];
      json['orderItems'].forEach((v) {
        orderItems?.add(OrderItems.fromJson(v));
      });
    }
  }
  int? orderId;
  String? checkoutUrl;
  String? userId;
  String? orderDate;
  double? totalAmount;
  String? paymentMethod;
  String? paymentStatus;
  String? message;
  String? shippingAddress;
  int? shippingCost;
  String? orderStatus;
  List<OrderItems>? orderItems;
CheckoutResponse copyWith({  int? orderId,
  String? checkoutUrl,
  String? userId,
  String? orderDate,
  double? totalAmount,
  String? paymentMethod,
  String? paymentStatus,
  String? message,
  String? shippingAddress,
  int? shippingCost,
  String? orderStatus,
  List<OrderItems>? orderItems,
}) => CheckoutResponse(  orderId: orderId ?? this.orderId,
  checkoutUrl: checkoutUrl ?? this.checkoutUrl,
  userId: userId ?? this.userId,
  orderDate: orderDate ?? this.orderDate,
  totalAmount: totalAmount ?? this.totalAmount,
  paymentMethod: paymentMethod ?? this.paymentMethod,
  paymentStatus: paymentStatus ?? this.paymentStatus,
  message: message ?? this.message,
  shippingAddress: shippingAddress ?? this.shippingAddress,
  shippingCost: shippingCost ?? this.shippingCost,
  orderStatus: orderStatus ?? this.orderStatus,
  orderItems: orderItems ?? this.orderItems,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['checkoutUrl'] = checkoutUrl;
    map['userId'] = userId;
    map['orderDate'] = orderDate;
    map['totalAmount'] = totalAmount;
    map['paymentMethod'] = paymentMethod;
    map['paymentStatus'] = paymentStatus;
    map['message'] = message;
    map['shippingAddress'] = shippingAddress;
    map['shippingCost'] = shippingCost;
    map['orderStatus'] = orderStatus;
    if (orderItems != null) {
      map['orderItems'] = orderItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}