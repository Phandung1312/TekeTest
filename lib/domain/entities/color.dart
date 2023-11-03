import 'package:freezed_annotation/freezed_annotation.dart';
part 'color.freezed.dart';

@freezed
class ColorEntity with _$ColorEntity {
  const factory ColorEntity({
    @Default(0) int id,
    @Default("") String name,
  }) = _ColorEntity;
}
