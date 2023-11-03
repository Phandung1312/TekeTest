import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teko_test_app/core/errors/failures.dart';
import 'package:teko_test_app/core/network/base_remote_service.dart';
import 'package:teko_test_app/data/api/app_api_service.dart';
import 'package:teko_test_app/data/models/color_model.dart';
import 'package:teko_test_app/data/models/error_product_model.dart';

abstract class IErrorProductRemoteDataSource {
  Future<Either<Failure, List<ErrorProductModel>>> getErrorProducts();
  Future<Either<Failure, List<ColorModel>>> getColors();
}

@LazySingleton(as: IErrorProductRemoteDataSource)
class ErrorProductRemoteDataSource
    with BaseRemoteService
    implements IErrorProductRemoteDataSource {
  ErrorProductRemoteDataSource(this._apiService);
  final AppApiService _apiService;
  @override
  Future<Either<Failure, List<ColorModel>>> getColors() async {
    var result = await callApi<List<ColorModel>>(() => _apiService.getColors());
    return result;
  }

  @override
  Future<Either<Failure, List<ErrorProductModel>>> getErrorProducts() async {
    var result = await callApi(() => _apiService.getErrorProducts());
    return result;
  }
}
