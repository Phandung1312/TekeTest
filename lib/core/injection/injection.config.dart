// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:teko_test_app/core/injection/register_module.dart' as _i17;
import 'package:teko_test_app/data/api/app_api_service.dart' as _i9;
import 'package:teko_test_app/data/datasources/error_product_local_datasource.dart'
    as _i7;
import 'package:teko_test_app/data/datasources/error_product_remote_datasource.dart'
    as _i10;
import 'package:teko_test_app/data/mappers/color_mapper.dart' as _i4;
import 'package:teko_test_app/data/mappers/error_product_mapper.dart' as _i6;
import 'package:teko_test_app/data/repositories/error_product_repository_impl.dart'
    as _i12;
import 'package:teko_test_app/domain/repositories/error_product_repository.dart'
    as _i11;
import 'package:teko_test_app/domain/usecases/get_colors_usecase.dart' as _i13;
import 'package:teko_test_app/domain/usecases/get_error_products_usecase.dart'
    as _i14;
import 'package:teko_test_app/domain/usecases/save_edited_product_usecase.dart'
    as _i15;
import 'package:teko_test_app/presentation/screens/error_products/bloc/error_products_bloc.dart'
    as _i16;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.lazySingletonAsync<_i3.Box<dynamic>>(
      () => registerModule.openBox,
      preResolve: true,
    );
    gh.factory<_i4.ColorMapper>(() => _i4.ColorMapper());
    gh.lazySingleton<_i5.Dio>(() => registerModule.dio());
    gh.factory<_i6.ErrorProductMapper>(() => _i6.ErrorProductMapper());
    gh.lazySingleton<_i7.IErrorProductLocalDataSource>(
        () => _i7.ErrorProductLocalDataSource(gh<_i3.Box<dynamic>>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => registerModule.sharePreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i9.AppApiService>(
        () => registerModule.appApiservice(gh<_i5.Dio>()));
    gh.lazySingleton<_i10.IErrorProductRemoteDataSource>(
        () => _i10.ErrorProductRemoteDataSource(gh<_i9.AppApiService>()));
    gh.lazySingleton<_i11.ErrorProductRepository>(
        () => _i12.ErrorProductRepositoryImpl(
              gh<_i4.ColorMapper>(),
              gh<_i6.ErrorProductMapper>(),
              gh<_i10.IErrorProductRemoteDataSource>(),
              gh<_i7.IErrorProductLocalDataSource>(),
            ));
    gh.lazySingleton<_i13.GetColorsUseCase>(
        () => _i13.GetColorsUseCase(gh<_i11.ErrorProductRepository>()));
    gh.lazySingleton<_i14.GetErrorProductsUseCase>(
        () => _i14.GetErrorProductsUseCase(gh<_i11.ErrorProductRepository>()));
    gh.lazySingleton<_i15.SaveEditedProductUseCase>(
        () => _i15.SaveEditedProductUseCase(gh<_i11.ErrorProductRepository>()));
    gh.factory<_i16.ErrorProductsBloc>(() => _i16.ErrorProductsBloc(
          gh<_i14.GetErrorProductsUseCase>(),
          gh<_i13.GetColorsUseCase>(),
          gh<_i15.SaveEditedProductUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
