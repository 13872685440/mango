// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apptree_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apptree_bean _$Apptree_beanFromJson(Map<String, dynamic> json) {
  return Apptree_bean()
    ..clc = json['clc'] as String
    ..code = json['code'] as String
    ..component = json['component'] as String
    ..ct = json['ct'] as String
    ..id = json['id'] as String
    ..isLeaf = json['isLeaf'] as bool
    ..name = json['name'] as String
    ..superior_code = json['superior_code'] as String
    ..superior_name = json['superior_name'] as String
    ..tmpId = json['tmpId'] as String
    ..wn = json['wn'] as String
    ..xh = json['xh'] as num;
}

Map<String, dynamic> _$Apptree_beanToJson(Apptree_bean instance) =>
    <String, dynamic>{
      'clc': instance.clc,
      'code': instance.code,
      'component': instance.component,
      'ct': instance.ct,
      'id': instance.id,
      'isLeaf': instance.isLeaf,
      'name': instance.name,
      'superior_code': instance.superior_code,
      'superior_name': instance.superior_name,
      'tmpId': instance.tmpId,
      'wn': instance.wn,
      'xh': instance.xh
    };
