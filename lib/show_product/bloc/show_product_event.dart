part of 'show_product_bloc.dart';

@immutable
abstract class ShowProductEvent {
  const ShowProductEvent();

  List<Object> get props => [];
}

class GetProductsEvent extends ShowProductEvent {
  const GetProductsEvent({required this.favorites});

  final bool favorites;

  @override
  List<Object> get props => [favorites];
}
