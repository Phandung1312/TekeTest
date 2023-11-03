import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:teko_test_app/core/errors/failures.dart';
import 'package:teko_test_app/data/models/color_model.dart';
import 'package:teko_test_app/data/models/error_product_model.dart';

const String CACHED_ERROR_PRODUCTS = 'CACHED_ERROR_PRODUCTS';
const String CACHED_COLORS = 'CACHED_COLORS';

abstract class IErrorProductLocalDataSource {
  Future<void> cacheColors(List<ColorModel> models);
  Future<Either<Failure, List<ColorModel>>> getColors();
  Future<void> cacheErrorProducts(List<ErrorProductModel> models);
  Future<Either<Failure, List<ErrorProductModel>>> getErrorProducts(int page);
}

@LazySingleton(as : IErrorProductLocalDataSource)
class ErrorProductLocalDataSource implements IErrorProductLocalDataSource {
  ErrorProductLocalDataSource(this._box);
  final Box _box;

  @override
  Future<void> cacheErrorProducts(List<ErrorProductModel> models) async{
    return _box.put(CACHED_ERROR_PRODUCTS,
        json.encode(models.map((e) => e.toJson()).toList()));
  }

  @override
  Future<Either<Failure, List<ErrorProductModel>>> getErrorProducts(int page) async{
    final modelString = _box.get(CACHED_ERROR_PRODUCTS);
    if (modelString == null) return Left(CacheFailure());
    
    const itemsPerPage = 10;
    var storedData = json.decode(modelString);
    storedData = storedData as List;
      final startIndex = (page - 1) * itemsPerPage;
      if(startIndex > storedData.length) return Left(EmptyListFailure());
    final endIndex = (storedData.length <= startIndex + itemsPerPage ) ? storedData.length :  startIndex + itemsPerPage;


    final dataForPage = storedData.sublist(startIndex, endIndex);

    return Right(dataForPage.map<ErrorProductModel>((e) => ErrorProductModel.fromJson(e)).toList());

  }
  
  @override
  Future<void> cacheColors(List<ColorModel> models) async{
    return _box.put(CACHED_COLORS, json.encode(models.map((e) => e.toJson()).toList()));
  }
  
  @override
  Future<Either<Failure, List<ColorModel>>> getColors() async{
    final modelString = _box.get(CACHED_COLORS);
     if (modelString == null) return Left(CacheFailure());
     
     return Right(json.decode(modelString).map<ColorModel>((e) => ColorModel.fromJson(e)).toList());
  }
}
