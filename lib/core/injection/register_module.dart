import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teko_test_app/data/api/app_api_service.dart';

@module
abstract class RegisterModule{
  @lazySingleton
  Dio dio() => Dio();

  @preResolve
  @lazySingleton
  Future<Box> get openBox async{
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    return  Hive.openBox<String>("MyBox");
  }
  
  @lazySingleton
  AppApiService appApiservice(Dio dio) => AppApiService(dio);

  @preResolve
  Future<SharedPreferences> get sharePreferences => SharedPreferences.getInstance();
}