class OrderModel {
  String productName;
  double productPrice;
  int productQuantity;
  DateTime orderDateTime;
  String productImage;

  OrderModel({
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.orderDateTime,
    required this.productImage,
  });
}
