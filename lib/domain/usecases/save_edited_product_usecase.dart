
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teko_test_app/core/errors/failures.dart';
import 'package:teko_test_app/core/usecase/usecase.dart';
import 'package:teko_test_app/domain/entities/error_product.dart';
import 'package:teko_test_app/domain/repositories/error_product_repository.dart';

@lazySingleton
class SaveEditedProductUseCase extends UseCase<void, List<ErrorProduct>>{
    final ErrorProductRepository _errorProductRepository;
     SaveEditedProductUseCase(this._errorProductRepository);
  @override
  Future<Either<Failure, void>> call(List<ErrorProduct> params)async{
    return await _errorProductRepository.saveEditedProducts(params);
  }


}