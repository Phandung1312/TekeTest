

part of 'error_products_bloc.dart';

 class  ErrorProductsState extends Equatable{
  final bool isEditting;
  final List<ErrorProduct> errorProducts;
  List<ErrorProduct> editedProducts = [];
  final List<ColorEntity> colors;
  ErrorProductsState(this.errorProducts, this.isEditting, this.colors, this.editedProducts);
  
  @override
  List<Object?> get props =>[errorProducts];
}

class ErrorProductsInitial extends ErrorProductsState{
  ErrorProductsInitial() : super([], false, [], []);
}

class ErrorProductsEditing extends ErrorProductsState{
  ErrorProductsEditing(ErrorProductsState state) : super(state.errorProducts, true, state.colors, []);
}
class ErrorProductsLoading extends ErrorProductsState{
  ErrorProductsLoading(ErrorProductsState state) : super(state.errorProducts, state.isEditting, [], state.editedProducts);
}

class ErrorProductsLoadSuccess extends ErrorProductsState{
   ErrorProductsLoadSuccess({required List<ErrorProduct> errorProducts,required ErrorProductsState state}) : super(errorProducts, state.isEditting, [], state.editedProducts);
}

class ErrorProductsLoadingMore extends ErrorProductsState{
    ErrorProductsLoadingMore(ErrorProductsState state) : super(state.errorProducts, state.isEditting, [], state.editedProducts);
}

class ErrorProductsLoadError extends ErrorProductsState{
  ErrorProductsLoadError(ErrorProductsState state) : super([], state.isEditting, [], state.editedProducts);
}

class LoadColorsSuccess extends ErrorProductsState{
  LoadColorsSuccess({required List<ColorEntity> colors,required ErrorProductsState state}) : super(state.errorProducts, state.isEditting, colors, state.editedProducts);
}

class SaveEditedProductError extends ErrorProductsState{
  SaveEditedProductError(ErrorProductsState state) : super(state.editedProducts, state.isEditting,[], []);
}

class SaveEditedProductSucces extends ErrorProductsState{
  SaveEditedProductSucces(ErrorProductsState state) : super(state.editedProducts, state.isEditting,[], state.editedProducts);
}