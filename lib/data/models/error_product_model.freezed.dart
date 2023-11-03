// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorProductModel _$ErrorProductModelFromJson(Map<String, dynamic> json) {
  return _ErrorProductModel.fromJson(json);
}

/// @nodoc
mixin _$ErrorProductModel {
  int get id => throw _privateConstructorUsedError;
  String? get errorDescription => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorProductModelCopyWith<ErrorProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorProductModelCopyWith<$Res> {
  factory $ErrorProductModelCopyWith(
          ErrorProductModel value, $Res Function(ErrorProductModel) then) =
      _$ErrorProductModelCopyWithImpl<$Res, ErrorProductModel>;
  @useResult
  $Res call(
      {int id,
      String? errorDescription,
      String? name,
      String? sku,
      String? image,
      int? color});
}

/// @nodoc
class _$ErrorProductModelCopyWithImpl<$Res, $Val extends ErrorProductModel>
    implements $ErrorProductModelCopyWith<$Res> {
  _$ErrorProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? errorDescription = freezed,
    Object? name = freezed,
    Object? sku = freezed,
    Object? image = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      errorDescription: freezed == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorProductModelImplCopyWith<$Res>
    implements $ErrorProductModelCopyWith<$Res> {
  factory _$$ErrorProductModelImplCopyWith(_$ErrorProductModelImpl value,
          $Res Function(_$ErrorProductModelImpl) then) =
      __$$ErrorProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? errorDescription,
      String? name,
      String? sku,
      String? image,
      int? color});
}

/// @nodoc
class __$$ErrorProductModelImplCopyWithImpl<$Res>
    extends _$ErrorProductModelCopyWithImpl<$Res, _$ErrorProductModelImpl>
    implements _$$ErrorProductModelImplCopyWith<$Res> {
  __$$ErrorProductModelImplCopyWithImpl(_$ErrorProductModelImpl _value,
      $Res Function(_$ErrorProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? errorDescription = freezed,
    Object? name = freezed,
    Object? sku = freezed,
    Object? image = freezed,
    Object? color = freezed,
  }) {
    return _then(_$ErrorProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      errorDescription: freezed == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorProductModelImpl implements _ErrorProductModel {
  const _$ErrorProductModelImpl(
      {required this.id,
      this.errorDescription,
      this.name,
      this.sku,
      this.image,
      this.color});

  factory _$ErrorProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorProductModelImplFromJson(json);

  @override
  final int id;
  @override
  final String? errorDescription;
  @override
  final String? name;
  @override
  final String? sku;
  @override
  final String? image;
  @override
  final int? color;

  @override
  String toString() {
    return 'ErrorProductModel(id: $id, errorDescription: $errorDescription, name: $name, sku: $sku, image: $image, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.errorDescription, errorDescription) ||
                other.errorDescription == errorDescription) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, errorDescription, name, sku, image, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorProductModelImplCopyWith<_$ErrorProductModelImpl> get copyWith =>
      __$$ErrorProductModelImplCopyWithImpl<_$ErrorProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorProductModelImplToJson(
      this,
    );
  }
}

abstract class _ErrorProductModel implements ErrorProductModel {
  const factory _ErrorProductModel(
      {required final int id,
      final String? errorDescription,
      final String? name,
      final String? sku,
      final String? image,
      final int? color}) = _$ErrorProductModelImpl;

  factory _ErrorProductModel.fromJson(Map<String, dynamic> json) =
      _$ErrorProductModelImpl.fromJson;

  @override
  int get id;
  @override
  String? get errorDescription;
  @override
  String? get name;
  @override
  String? get sku;
  @override
  String? get image;
  @override
  int? get color;
  @override
  @JsonKey(ignore: true)
  _$$ErrorProductModelImplCopyWith<_$ErrorProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
