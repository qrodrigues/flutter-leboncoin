import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:leboncoin/service/firebase_api.dart';
import 'package:leboncoin/repository/product_repository.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<SubmitProductEvent>((event, emit) {
      emit(AddProductLoading());

      try {
        if (event.title != "" && event.price != "" && event.price is double && event.description != "") {
          ProductRepository repository = ProductRepository();
          repository.addProduct(
            event.title,
            event.price,
            event.description,
          );
          emit(AddProductSuccess());
        } else {
          emit(AddProductError());
        }
      } catch (e) {
        emit(AddProductError());
      }
    });
  }
}
