class CartModel {
  String productName;
  double productPrice;
  int productQuantity;
  DateTime orderDateTime;
  String productImage;
  double subTotal;
  double taxFees;
  double deliveryFees;
  double total;

  CartModel({
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    required this.orderDateTime,
    required this.productName,
    required this.subTotal,
    required this.taxFees,
    required this.deliveryFees,
    required this.total,
  });
}
