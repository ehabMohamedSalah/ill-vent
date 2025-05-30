class CheckoutModel{

  List<int>cartItemIds;
  String paymentMethod;
  String shippingAddress;
  bool? createOrder;
  CheckoutModel({required this.cartItemIds,required this.createOrder,required this.paymentMethod,required this.shippingAddress});

}