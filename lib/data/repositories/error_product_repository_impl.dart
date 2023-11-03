

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teko_test_app/core/errors/failures.dart';
import 'package:teko_test_app/core/injection/injection.dart';
import 'package:teko_test_app/data/datasources/error_product_local_datasource.dart';
import 'package:teko_test_app/data/datasources/error_product_remote_datasource.dart';
import 'package:teko_test_app/data/mappers/color_mapper.dart';
import 'package:teko_test_app/data/mappers/error_product_mapper.dart';
import 'package:teko_test_app/domain/entities/color.dart';
import 'package:teko_test_app/domain/entities/error_product.dart';
import 'package:teko_test_app/domain/repositories/error_product_repository.dart';

@LazySingleton(as : ErrorProductRepository)
class ErrorProductRepositoryImpl implements ErrorProductRepository{
  final ColorMapper _colorMapper;
  final ErrorProductMapper _errorProductMapper;
  final IErrorProductRemoteDataSource _errorProductRemoteDataSource;
  final IErrorProductLocalDataSource _errorProductLocalDataSource;
  ErrorProductRepositoryImpl(this._colorMapper, this._errorProductMapper, this._errorProductRemoteDataSource, this._errorProductLocalDataSource);
  @override
  Future<Either<Failure, List<ErrorProduct>>> getErrorProducts(int page) async{
    final pref = getIt<SharedPreferences>();
    bool isSync = pref.getBool('isSync') ?? false;
    if(!isSync){
      var colorResponse = await _errorProductRemoteDataSource.getColors();
      colorResponse.fold((l){
        debugPrint("ERROR Call Color");
        return Left(l);
      }, (colors) async{
    await  _errorProductLocalDataSource.cacheColors(colors);
    var errorProductsResponse = await _errorProductRemoteDataSource.getErrorProducts();
   errorProductsResponse.fold((l){
    debugPrint("ERROR Call Product");
    return Left(l);
   }, (errorProducts) async{
      _errorProductLocalDataSource.cacheErrorProducts(errorProducts);
      await pref.setBool('isSync', true);
    });
      });
    }


  var colorsLocal = await _errorProductLocalDataSource.getColors();
  return colorsLocal.fold((l) {
    debugPrint("ERROR Get Colors from cache");
    return Left(l);
  }, (colorModels) async{
    var colors = colorModels.map((e) => _colorMapper.maptoEntity(e));
    var errorProductsLocal = await _errorProductLocalDataSource.getErrorProducts(page);
    return errorProductsLocal.fold((l){
      debugPrint("ERROR Get Products from cache");
      return Left(l);
    }, (errorProducts)  {
       return Right(errorProducts.map((e) {
              var color = e.color != null
                  ? colors.firstWhere((element) => e.color == element.id)
                  : null;
              var newValue = _errorProductMapper.maptoEntity(e);
              return newValue.copyWith(color: color);
            }).toList());
    });
  });
    
  }

  @override
  Future<Either<Failure, List<ColorEntity>>> getColors() async{
    var result = await _errorProductLocalDataSource.getColors();
    return result.fold((l) => Left(l), (r) => Right(r.map((e) => _colorMapper.maptoEntity(e)).toList()));
  }
  
  @override
  Future<Either<Failure, void>> saveEditedProducts(List<ErrorProduct> products) async{
    var models = products.map((e) => _errorProductMapper.maptoModel(e)).toList();
    try{
      await _errorProductLocalDataSource.cacheErrorProducts(models);
      return const Right(null);
    }catch(e){
      return Left(CacheFailure());
    }
  }

}