

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teko_test_app/core/errors/failures.dart';
import 'package:teko_test_app/core/usecase/usecase.dart';
import 'package:teko_test_app/domain/entities/error_product.dart';
import 'package:teko_test_app/domain/repositories/error_product_repository.dart';

@lazySingleton
class GetErrorProductsUseCase extends UseCase<List<ErrorProduct>, int>{
  final ErrorProductRepository _errorProductRepository;
  GetErrorProductsUseCase(this._errorProductRepository);
  @override
  Future<Either<Failure, List<ErrorProduct>>> call(int params) {
    return   _errorProductRepository.getErrorProducts(params);
  }

}