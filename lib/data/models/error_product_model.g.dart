// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorProductModelImpl _$$ErrorProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ErrorProductModelImpl(
      id: json['id'] as int,
      errorDescription: json['errorDescription'] as String?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      image: json['image'] as String?,
      color: json['color'] as int?,
    );

Map<String, dynamic> _$$ErrorProductModelImplToJson(
        _$ErrorProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'errorDescription': instance.errorDescription,
      'name': instance.name,
      'sku': instance.sku,
      'image': instance.image,
      'color': instance.color,
    };
