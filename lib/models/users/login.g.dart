// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login()
    ..loginName = json['loginName'] as String
    ..pwd = json['pwd'] as String;
}

Map<String, dynamic> _$LoginToJson(Login instance) =>
    <String, dynamic>{'loginName': instance.loginName, 'pwd': instance.pwd};
