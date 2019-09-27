// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bean_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User_bean_info _$User_bean_infoFromJson(Map<String, dynamic> json) {
  return User_bean_info()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..password = json['password'] as String
    ..posts = (json['posts'] as List)
        ?.map(
            (e) => e == null ? null : Posts.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..roles = (json['roles'] as List)
        ?.map(
            (e) => e == null ? null : Role.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..salt = json['salt'] as String
    ..status = json['status'] as String
    ..token = json['token'] as String
    ..userRoles = json['userRoles'] as List
    ..username = json['username'] as String
    ..avatar = json['avatar'] as String
    ..apps = (json['apps'] as List)
        ?.map((e) =>
            e == null ? null : Apptree.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$User_bean_infoToJson(User_bean_info instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'posts': instance.posts,
      'roles': instance.roles,
      'salt': instance.salt,
      'status': instance.status,
      'token': instance.token,
      'userRoles': instance.userRoles,
      'username': instance.username,
      'avatar': instance.avatar,
      'apps': instance.apps
    };
