part of 'add_product_bloc.dart';

abstract class AddProductEvent {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}

class SubmitProductEvent extends AddProductEvent {
  final String title;
  final double price;
  final String description;

  const SubmitProductEvent(
    this.title,
    this.price,
    this.description,
  );

  @override
  List<Object> get props => [title, price, description];
}