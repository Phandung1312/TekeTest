

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teko_test_app/core/errors/failures.dart';
import 'package:teko_test_app/core/usecase/usecase.dart';
import 'package:teko_test_app/domain/entities/color.dart';
import 'package:teko_test_app/domain/repositories/error_product_repository.dart';

@lazySingleton
class GetColorsUseCase extends NoPramsUseCase<List<ColorEntity>>{
   final ErrorProductRepository _errorProductRepository;
  GetColorsUseCase(this._errorProductRepository);
  @override
  Future<Either<Failure, List<ColorEntity>>> call() {
    return _errorProductRepository.getColors();
  }
 

}