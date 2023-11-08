part of 'order_bloc.dart';

class OrderState extends Equatable {
  final int totalOrderCount;
  final List<Product> orders;
  final double totalPrice;
  const OrderState({
    required this.totalOrderCount,
    required this.orders,
    required this.totalPrice,
  });

  factory OrderState.initial() =>
      const OrderState(totalOrderCount: 0, orders: [], totalPrice: 0.0);

  OrderState copyWith({
    int? totalOrderCount,
    List<Product>? orders,
    double? totalPrice,
  }) {
    return OrderState(
      totalOrderCount: totalOrderCount ?? this.totalOrderCount,
      orders: orders ?? this.orders,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalOrderCount': totalOrderCount,
      'orders': orders.map((x) => x.toMap()).toList(),
      'totalPrice': totalPrice,
    };
  }

  factory OrderState.fromMap(Map<String, dynamic> map) {
    return OrderState(
      totalOrderCount: map['totalOrderCount'] as int,
      orders: List<Product>.from(
        (map['orders'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalPrice: map['totalPrice'] as double,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [totalOrderCount, orders, totalPrice];
}
