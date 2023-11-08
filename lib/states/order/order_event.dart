part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class AddProductToOrder extends OrderEvent {
  final Product product;
  const AddProductToOrder(this.product);
}

class DeleteProductToOrder extends OrderEvent {}

class GetProductToOrder extends OrderEvent {}
