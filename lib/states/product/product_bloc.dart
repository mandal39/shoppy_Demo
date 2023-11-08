import 'package:bloc/bloc.dart';
import 'package:demo/config/dummy.dart';
import 'package:demo/config/enums.dart';
import 'package:demo/domain/product.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.initial()) {
    on<GetProduct>(_getProduct);
    on<AddProduct>(_addProduct);
    on<DeleteProduct>(_deleteProduct);
  }
  Future<void> _getProduct(GetProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(
        state.copyWith(products: Dummy.products, status: ProductStatus.loaded));
  }

  void _addProduct(AddProduct event, Emitter<ProductState> emit) {}
  void _deleteProduct(DeleteProduct event, Emitter<ProductState> emit) {}
}
