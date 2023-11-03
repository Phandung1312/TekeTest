

part of 'error_products_bloc.dart';

abstract class ErrorProductsEvent{}
class StartEditProduct extends ErrorProductsEvent{
}

class EditedProduct extends ErrorProductsEvent{
  final ErrorProduct product;
  EditedProduct({required this.product});
}
class SaveEditedProduct extends ErrorProductsEvent{}
class Load extends ErrorProductsEvent{}
class LoadMore extends ErrorProductsEvent{}
class LoadColors extends ErrorProductsEvent{}