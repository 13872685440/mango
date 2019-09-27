// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return Permission()
    ..permissionId = json['permissionId'] as String
    ..permissionName = json['permissionName'] as String;
}

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'permissionId': instance.permissionId,
      'permissionName': instance.permissionName
    };
