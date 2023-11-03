import 'package:freezed_annotation/freezed_annotation.dart';
part 'color_model.freezed.dart';
part 'color_model.g.dart';
@freezed
class ColorModel with _$ColorModel{
  const factory ColorModel(
    {
      required int id,
      String? name
    }
  ) = _ColorModel;

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
}