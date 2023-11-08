part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<Product> products;
  final int quantity;
  final ProductStatus status;

  const ProductState({
    required this.products,
    required this.quantity,
    required this.status,
  });

  @override
  List<Object> get props => [products, quantity, status];

  factory ProductState.initial() {
    return const ProductState(
        products: [], quantity: 0, status: ProductStatus.initial);
  }

  ProductState copyWith({
    List<Product>? products,
    int? quantity,
    ProductStatus? status,
  }) {
    return ProductState(
      products: products ?? this.products,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;
}
