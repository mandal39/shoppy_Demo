part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProduct extends ProductEvent {}

class DeleteProduct extends ProductEvent {}

class AddProduct extends ProductEvent {}
