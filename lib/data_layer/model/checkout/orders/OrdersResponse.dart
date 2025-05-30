import 'OrderItems.dart';

/// orderId : 15
/// userId : "USR-5X79-0253"
/// orderDate : "2025-05-30T18:20:08.2517429"
/// totalAmount : 385.00
/// paymentMethod : "cash"
/// paymentStatus : "Pending"
/// shippingAddress : "12 St,nasser city"
/// shippingCost : 35.00
/// orderStatus : "Pending"
/// orderItems : [{"orderItemId":12,"orderId":15,"productId":2,"productName":"Credit Card (Premium)","productImage":"https://illventapp.azurewebsites.net/images/products/source/credit-card-premium.jpg","quantity":1,"unitPrice":350.00,"totalPrice":350.00}]

class OrdersResponse {
  OrdersResponse({
      this.orderId, 
      this.userId, 
      this.orderDate, 
      this.totalAmount, 
      this.paymentMethod, 
      this.paymentStatus, 
      this.shippingAddress, 
      this.shippingCost, 
      this.orderStatus, 
      this.orderItems,});

  OrdersResponse.fromJson(dynamic json) {
    orderId = json['orderId'];
    userId = json['userId'];
    orderDate = json['orderDate'];
    totalAmount = json['totalAmount'];
    paymentMethod = json['paymentMethod'];
    paymentStatus = json['paymentStatus'];
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
  String? userId;
  String? orderDate;
  double? totalAmount;
  String? paymentMethod;
  String? paymentStatus;
  String? shippingAddress;
  double? shippingCost;
  String? orderStatus;
  List<OrderItems>? orderItems;
OrdersResponse copyWith({  int? orderId,
  String? userId,
  String? orderDate,
  double? totalAmount,
  String? paymentMethod,
  String? paymentStatus,
  String? shippingAddress,
  double? shippingCost,
  String? orderStatus,
  List<OrderItems>? orderItems,
}) => OrdersResponse(  orderId: orderId ?? this.orderId,
  userId: userId ?? this.userId,
  orderDate: orderDate ?? this.orderDate,
  totalAmount: totalAmount ?? this.totalAmount,
  paymentMethod: paymentMethod ?? this.paymentMethod,
  paymentStatus: paymentStatus ?? this.paymentStatus,
  shippingAddress: shippingAddress ?? this.shippingAddress,
  shippingCost: shippingCost ?? this.shippingCost,
  orderStatus: orderStatus ?? this.orderStatus,
  orderItems: orderItems ?? this.orderItems,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['userId'] = userId;
    map['orderDate'] = orderDate;
    map['totalAmount'] = totalAmount;
    map['paymentMethod'] = paymentMethod;
    map['paymentStatus'] = paymentStatus;
    map['shippingAddress'] = shippingAddress;
    map['shippingCost'] = shippingCost;
    map['orderStatus'] = orderStatus;
    if (orderItems != null) {
      map['orderItems'] = orderItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}