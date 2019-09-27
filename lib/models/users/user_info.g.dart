// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User_info _$User_infoFromJson(Map<String, dynamic> json) {
  return User_info()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..password = json['password'] as String
    ..salt = json['salt'] as String
    ..service = json['service'] as String
    ..status = json['status'] as String
    ..token = json['token'] as String
    ..userRoles = json['userRoles'] as List
    ..username = json['username'] as String;
}

Map<String, dynamic> _$User_infoToJson(User_info instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'salt': instance.salt,
      'service': instance.service,
      'status': instance.status,
      'token': instance.token,
      'userRoles': instance.userRoles,
      'username': instance.username
    };
