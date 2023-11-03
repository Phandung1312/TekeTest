

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:teko_test_app/core/errors/failures.dart';

mixin BaseRemoteService {
  Future<Either<Failure, T>> callApi<T>(Future<HttpResponse<T>> Function() call) async {
   try {
      var httpResponse = await call();
      if(httpResponse.response.statusCode == HttpStatus.ok){
        var model = httpResponse.data;
        return Right(model);
      }
      else{
        return const  Left(ApiServerFailure('Có lỗi xảy ra'));
      }
    } on DioException catch(e){
      debugPrint("Check Debug ${e.error.toString()}");
      if(e.type == DioExceptionType.receiveTimeout){
        return Left(ApiTimeOutFailure());
      }
      else{
        return Left(ExceptionFailure(e));
      }
    }
  }
}
