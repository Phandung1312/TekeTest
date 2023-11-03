
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teko_test_app/domain/entities/color.dart';

part 'error_product.freezed.dart';

@freezed
class ErrorProduct with _$ErrorProduct{
  const factory ErrorProduct(
    {
      @Default(0)
      int id,
      @Default("")
      String errorDescription,
      @Default("")
      String name,
      @Default("")
      String sku,
      @Default("")
      String imageUrl,
      ColorEntity? color,
    }
  ) = _ErrorProduct;
}