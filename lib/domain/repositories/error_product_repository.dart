

import 'package:dartz/dartz.dart';
import 'package:teko_test_app/core/errors/failures.dart';
import 'package:teko_test_app/domain/entities/color.dart';
import 'package:teko_test_app/domain/entities/error_product.dart';

abstract class ErrorProductRepository{
  Future<Either<Failure, List<ErrorProduct>>> getErrorProducts(int page);
  Future<Either<Failure, List<ColorEntity>>> getColors();
  Future<Either<Failure, void>> saveEditedProducts(List<ErrorProduct> products);
}