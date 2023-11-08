import 'package:demo/config/enums.dart';
import 'package:demo/domain/product.dart';

class Order {
  final int id;
  final Product products;
  final int quantity;
  final double totalPrice;
  final OrderStatus status;
  Order({
    required this.id,
    required this.products,
    required this.quantity,
    required this.totalPrice,
    required this.status,
  });

  Order copyWith({
    int? id,
    Product? products,
    int? quantity,
    double? totalPrice,
    OrderStatus? status,
  }) {
    return Order(
      id: id ?? this.id,
      products: products ?? this.products,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'Order(id: $id, products: $products, quantity: $quantity, totalPrice: $totalPrice, status: $status)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.products == products &&
        other.quantity == quantity &&
        other.totalPrice == totalPrice &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        products.hashCode ^
        quantity.hashCode ^
        totalPrice.hashCode ^
        status.hashCode;
  }
}
