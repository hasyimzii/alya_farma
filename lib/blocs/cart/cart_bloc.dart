import 'package:alya_farma/services/cart_api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    Cart cart;
    List<CartData> cartData = [];

    on<GetCart>((event, emit) async {
      try {
        cart = await CartApi.getCart(
          email: event.email,
          token: event.token,
        );

        cartData = cart.data!;

        emit(CartLoaded(
          cart: cart.data!,
          message: cart.message,
        ));
      } catch (e) {
        emit(CartError());
      }
    });

    on<StoreCart>((event, emit) async {
      try {
        Map<String, dynamic> data = {
          'product_id': event.productId,
          'email': event.email,
        };
        cart = await CartApi.storeCart(
          data: data,
          token: event.token,
        );

        emit(CartLoaded(
          cart: cart.data!,
          message: cart.message,
        ));
      } catch (e) {
        emit(CartError());
      }
    });

    on<CheckCart>((event, emit) {
      cartData[event.index].check = event.value;

      emit(CartLoaded(
        cart: cartData,
        message: '',
      ));
    });

    on<AddAmountCart>((event, emit) async {
      try {
        Map<String, dynamic> data = {
          'id': event.id,
        };
        cart = await CartApi.addAmountCart(
          data: data,
          token: event.token,
        );

        String amount = cartData[event.index].amount;
        int result = int.parse(amount) + 1;
        cartData[event.index].amount = result.toString();

        emit(CartLoaded(
          cart: cartData,
          message: cart.message,
        ));
      } catch (e) {
        emit(CartError());
      }
    });

    on<SubAmountCart>((event, emit) async {
      if (int.parse(event.amount) > 0) {
        try {
          Map<String, dynamic> data = {
            'id': event.id,
          };
          cart = await CartApi.subAmountCart(
            data: data,
            token: event.token,
          );

          String amount = cartData[event.index].amount;
          int result = int.parse(amount) - 1;
          cartData[event.index].amount = result.toString();

          emit(CartLoaded(
            cart: cartData,
            message: cart.message,
          ));
        } catch (e) {
          emit(CartError());
        }
      }
    });

    on<DeleteCart>((event, emit) async {
      try {
        Map<String, dynamic> data = {
          'id': event.id,
        };
        cart = await CartApi.deleteCart(
          data: data,
          token: event.token,
        );

        cartData.removeAt(event.index);

        emit(CartLoaded(
          cart: cartData,
          message: cart.message,
        ));
      } catch (e) {
        emit(CartError());
      }
    });
  }
}
