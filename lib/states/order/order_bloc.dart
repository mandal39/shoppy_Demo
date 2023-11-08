import 'package:bloc/bloc.dart';
import 'package:demo/domain/product.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState.initial()) {
    on<AddProductToOrder>(_addProductToOrder);
  }

  Future<void> _addProductToOrder(
      AddProductToOrder event, Emitter<OrderState> emit) async {
    emit(state.copyWith(totalOrderCount: state.totalOrderCount + 1));
    emit(state.copyWith(orders: [...state.orders, event.product]));
  }
}
