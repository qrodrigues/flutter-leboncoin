part of 'show_product_bloc.dart';

@immutable
abstract class ShowProductState {
  const ShowProductState();

  List<Object> get props => [];
}

class ShowProductInitial extends ShowProductState {}

class ShowProductLoading extends ShowProductState {}

class ShowProductSuccess extends ShowProductState {
  const ShowProductSuccess(this.products);

  final List<ProductCard> products;
}

class ShowProductError extends ShowProductState {}
