import 'package:dartz/dartz.dart';
import 'package:teko_test_app/core/errors/failures.dart';


abstract class BaseUseCase<T>{
  const BaseUseCase();
}

abstract class UseCase<T, P> extends BaseUseCase<T>{
  const UseCase() : super();
  Future<Either<Failure, T>> call(P params);
}

abstract class NoPramsUseCase<T> extends BaseUseCase<T>{
  const NoPramsUseCase() : super();
  Future<Either<Failure, T>> call();
}