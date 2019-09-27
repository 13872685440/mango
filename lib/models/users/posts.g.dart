// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posts _$PostsFromJson(Map<String, dynamic> json) {
  return Posts()
    ..ct = json['ct'] as String
    ..id = json['id'] as String
    ..leaf_code = json['leaf_code'] as String
    ..leaf_data = json['leaf_data'] as String
    ..organ_id = json['organ_id'] as String
    ..organ_name = json['organ_name'] as String
    ..permissions = json['permissions'] as List
    ..person_id = json['person_id'] as String
    ..person_name = json['person_name'] as String
    ..phone = json['phone'] as String
    ..roles = json['roles'] as List
    ..tmpId = json['tmpId'] as String
    ..xh = json['xh'] as num;
}

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
      'ct': instance.ct,
      'id': instance.id,
      'leaf_code': instance.leaf_code,
      'leaf_data': instance.leaf_data,
      'organ_id': instance.organ_id,
      'organ_name': instance.organ_name,
      'permissions': instance.permissions,
      'person_id': instance.person_id,
      'person_name': instance.person_name,
      'phone': instance.phone,
      'roles': instance.roles,
      'tmpId': instance.tmpId,
      'xh': instance.xh
    };
