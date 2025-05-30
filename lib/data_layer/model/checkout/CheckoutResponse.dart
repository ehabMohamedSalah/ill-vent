import 'Orders.dart';

/// orders : [{"orderId":12,"userId":"USR-5X79-0253","orderDate":"2025-05-30T17:28:21.8123257Z","totalAmount":385.00,"paymentMethod":"cash","paymentStatus":"Pending","shippingAddress":"12 St,nasser city","shippingCost":35,"orderStatus":"Pending","orderItems":[{"orderItemId":9,"orderId":12,"productId":2,"productName":"Credit Card (Premium)","productImage":"https://illventapp.azurewebsites.net/images/products/source/credit-card-premium.jpg","quantity":1,"unitPrice":350.00,"totalPrice":350.00}]},{"orderId":13,"paymentMethod":"card","checkoutUrl":"https://checkout.stripe.com/c/pay/cs_test_b17jOXAuQ2E26jKuf3wKZI4uexxnQfojyQ0z93bDPbO8eXfX4ahS0nYLzf#fidkdWxOYHwnPyd1blpxYHZxWjA0V05WcD1UNn9gdkNTQ1RWMUhcfT03ZmhUQWNgQnZ2VFBUa1J8Tzx9XXdiU0dLRzFvdkJRVV1kV0dhV1VMRmxkXWtPV0Fjc2xzYm1pZFNRdE9QMDVpMVBqNTVTVldiaTJ3cycpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPydocGlxbFpscWBoJyknYGtkZ2lgVWlkZmBtamlhYHd2Jz9xd3BgeCUl"}]

class CheckoutResponse {
  CheckoutResponse({
      this.orders,});

  CheckoutResponse.fromJson(dynamic json) {
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
  }
  List<Orders>? orders;
CheckoutResponse copyWith({  List<Orders>? orders,
}) => CheckoutResponse(  orders: orders ?? this.orders,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}