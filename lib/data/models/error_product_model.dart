import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_product_model.freezed.dart';
part 'error_product_model.g.dart';
@freezed
class ErrorProductModel with _$ErrorProductModel {
  const factory ErrorProductModel(
    {
      required int id,
      String? errorDescription,
      String? name,
      String? sku,
      String? image,
      int? color,
    }
  ) = _ErrorProductModel;

  factory ErrorProductModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorProductModelFromJson(json);
}
