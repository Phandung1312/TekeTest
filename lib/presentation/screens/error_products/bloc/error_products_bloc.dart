import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:teko_test_app/domain/entities/color.dart';
import 'package:teko_test_app/domain/entities/error_product.dart';
import 'package:teko_test_app/domain/usecases/get_colors_usecase.dart';
import 'package:teko_test_app/domain/usecases/get_error_products_usecase.dart';
import 'package:teko_test_app/domain/usecases/save_edited_product_usecase.dart';

part 'error_products_state.dart';
part 'error_products._event.dart';

@injectable
class ErrorProductsBloc extends Bloc<ErrorProductsEvent, ErrorProductsState> {
  final GetErrorProductsUseCase _getErrorProductsUseCase;
  final GetColorsUseCase _getColorsUseCase;
  final SaveEditedProductUseCase _saveEditedProductUseCase;
  int page = 1;
  ScrollController controller = ScrollController();
  ErrorProductsBloc(this._getErrorProductsUseCase, this._getColorsUseCase, this._saveEditedProductUseCase)
      : super(ErrorProductsInitial()) {
    on<Load>(_onLoad);
    on<StartEditProduct>(_onEditErrorProduct);
    on<LoadMore>(_onLoadMore);
    on<LoadColors>(_onLoadColors);
    on<EditedProduct>(_onEditedProduct);
    on<SaveEditedProduct>(_onSaveEditedProduct);
  }
  _onSaveEditedProduct(SaveEditedProduct event, Emitter<ErrorProductsState> emit) async{
      var errorProducts = state.errorProducts;
      var either = await _saveEditedProductUseCase(errorProducts);
      either.fold((l) => emit(SaveEditedProductError(state)), (r){
        emit(SaveEditedProductSucces(state));
        emit(ErrorProductsLoadSuccess(errorProducts: errorProducts,state: state));
      });
  }
  _onEditedProduct(EditedProduct event, Emitter<ErrorProductsState> emit) async{
    var product = event.product;
    var errorProducts = state.errorProducts;
    var index = errorProducts.indexWhere((element) => element.id == product.id);
    if(index != -1){
      errorProducts[index] = product;
      state.editedProducts.add(product);
      emit(ErrorProductsLoadSuccess(errorProducts: errorProducts, state: state));
    }
  }
  _onLoadColors(LoadColors event, Emitter<ErrorProductsState> emit) async{
    var either = await _getColorsUseCase();
    either.fold((l) => null, (r) => emit(LoadColorsSuccess(colors: r, state: state)));
  }
  _onEditErrorProduct(
      StartEditProduct event, Emitter<ErrorProductsState> emit) {
         state.editedProducts.clear();
        emit(ErrorProductsEditing(state));
      }
  _onLoad(Load event, Emitter<ErrorProductsState> emit) async {
    emit(ErrorProductsLoading( state));
    final either = await _getErrorProductsUseCase(1);
    either.fold((l) => emit(ErrorProductsLoadError(state)),
        (r) => emit(ErrorProductsLoadSuccess(errorProducts: r, state: state)));
  }

  _onLoadMore(LoadMore event, Emitter<ErrorProductsState> emit) async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      emit(ErrorProductsLoadingMore(state));
      await Future.delayed(const Duration(seconds: 1));
      page++;
      final either = await _getErrorProductsUseCase(page);
      either.fold(
          (l) => emit(ErrorProductsLoadError(state)),
          (r) => emit(ErrorProductsLoadSuccess(
              errorProducts: [...state.errorProducts, ...r], state: state)));
    }
  }
}
