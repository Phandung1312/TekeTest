
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:teko_test_app/config/constants.dart';
import 'package:teko_test_app/data/models/color_model.dart';
import 'package:teko_test_app/data/models/error_product_model.dart';

part 'app_api_service.g.dart';
@RestApi(baseUrl : baseUrl)
abstract class AppApiService{
  factory AppApiService(Dio dio,{String baseUrl} ) = _AppApiService;

  @GET("products")
  Future<HttpResponse<List<ErrorProductModel>>> getErrorProducts();

  @GET("colors")
  Future<HttpResponse<List<ColorModel>>> getColors();
}