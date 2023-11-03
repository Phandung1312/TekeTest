
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:teko_test_app/core/injection/injection.config.dart';

final getIt = GetIt.instance;  
  
@InjectableInit()  
Future<void> configureInjection(String env) async {
   await getIt.init(environment: env);
} 