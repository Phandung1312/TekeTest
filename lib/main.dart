import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:teko_test_app/config/theme/app_theme.dart';
import 'package:teko_test_app/core/injection/injection.dart';
import 'package:teko_test_app/presentation/screens/error_products/bloc/error_products_bloc.dart';
import 'package:teko_test_app/presentation/screens/error_products/error_products_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<ErrorProductsBloc>(create: (_) => getIt())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const ErrorProductsScreen(),
        ));
  }
}
