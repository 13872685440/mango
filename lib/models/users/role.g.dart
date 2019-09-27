// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role()
    ..permissions = (json['permissions'] as List)
        ?.map((e) =>
            e == null ? null : Permission.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..roleId = json['roleId'] as String
    ..roleName = json['roleName'] as String;
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'permissions': instance.permissions,
      'roleId': instance.roleId,
      'roleName': instance.roleName
    };
