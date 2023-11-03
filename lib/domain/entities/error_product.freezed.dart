// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ErrorProduct {
  int get id => throw _privateConstructorUsedError;
  String get errorDescription => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  ColorEntity? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ErrorProductCopyWith<ErrorProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorProductCopyWith<$Res> {
  factory $ErrorProductCopyWith(
          ErrorProduct value, $Res Function(ErrorProduct) then) =
      _$ErrorProductCopyWithImpl<$Res, ErrorProduct>;
  @useResult
  $Res call(
      {int id,
      String errorDescription,
      String name,
      String sku,
      String imageUrl,
      ColorEntity? color});

  $ColorEntityCopyWith<$Res>? get color;
}

/// @nodoc
class _$ErrorProductCopyWithImpl<$Res, $Val extends ErrorProduct>
    implements $ErrorProductCopyWith<$Res> {
  _$ErrorProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? errorDescription = null,
    Object? name = null,
    Object? sku = null,
    Object? imageUrl = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      errorDescription: null == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ColorEntityCopyWith<$Res>? get color {
    if (_value.color == null) {
      return null;
    }

    return $ColorEntityCopyWith<$Res>(_value.color!, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ErrorProductImplCopyWith<$Res>
    implements $ErrorProductCopyWith<$Res> {
  factory _$$ErrorProductImplCopyWith(
          _$ErrorProductImpl value, $Res Function(_$ErrorProductImpl) then) =
      __$$ErrorProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String errorDescription,
      String name,
      String sku,
      String imageUrl,
      ColorEntity? color});

  @override
  $ColorEntityCopyWith<$Res>? get color;
}

/// @nodoc
class __$$ErrorProductImplCopyWithImpl<$Res>
    extends _$ErrorProductCopyWithImpl<$Res, _$ErrorProductImpl>
    implements _$$ErrorProductImplCopyWith<$Res> {
  __$$ErrorProductImplCopyWithImpl(
      _$ErrorProductImpl _value, $Res Function(_$ErrorProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? errorDescription = null,
    Object? name = null,
    Object? sku = null,
    Object? imageUrl = null,
    Object? color = freezed,
  }) {
    return _then(_$ErrorProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      errorDescription: null == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorEntity?,
    ));
  }
}

/// @nodoc

class _$ErrorProductImpl implements _ErrorProduct {
  const _$ErrorProductImpl(
      {this.id = 0,
      this.errorDescription = "",
      this.name = "",
      this.sku = "",
      this.imageUrl = "",
      this.color});

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String errorDescription;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String sku;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  final ColorEntity? color;

  @override
  String toString() {
    return 'ErrorProduct(id: $id, errorDescription: $errorDescription, name: $name, sku: $sku, imageUrl: $imageUrl, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.errorDescription, errorDescription) ||
                other.errorDescription == errorDescription) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, errorDescription, name, sku, imageUrl, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorProductImplCopyWith<_$ErrorProductImpl> get copyWith =>
      __$$ErrorProductImplCopyWithImpl<_$ErrorProductImpl>(this, _$identity);
}

abstract class _ErrorProduct implements ErrorProduct {
  const factory _ErrorProduct(
      {final int id,
      final String errorDescription,
      final String name,
      final String sku,
      final String imageUrl,
      final ColorEntity? color}) = _$ErrorProductImpl;

  @override
  int get id;
  @override
  String get errorDescription;
  @override
  String get name;
  @override
  String get sku;
  @override
  String get imageUrl;
  @override
  ColorEntity? get color;
  @override
  @JsonKey(ignore: true)
  _$$ErrorProductImplCopyWith<_$ErrorProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
