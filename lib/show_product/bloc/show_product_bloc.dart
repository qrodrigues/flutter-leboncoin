import 'package:bloc/bloc.dart';
import 'package:leboncoin/repository/product_repository.dart';
import 'package:meta/meta.dart';

import '../widgets/product_card.dart';

part 'show_product_event.dart';

part 'show_product_state.dart';

class ShowProductBloc extends Bloc<ShowProductEvent, ShowProductState> {
  ShowProductBloc(ProductRepository productRepository)
      : _productRepository = productRepository,
        super(ShowProductInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ShowProductLoading());
      try {
        List<ProductCard> products;
        if (event.favorites) {
          products = await _productRepository.getFavoritesProducts();
        } else {
          products = await _productRepository.getAllProducts();
        }
        emit(ShowProductSuccess(products));
      } catch (e) {
        emit(ShowProductError());
      }
    });
  }

  final ProductRepository _productRepository;
}
