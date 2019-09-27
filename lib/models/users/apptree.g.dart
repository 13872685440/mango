// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apptree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apptree _$ApptreeFromJson(Map<String, dynamic> json) {
  return Apptree()
    ..children = json['children'] as List
    ..colorCode = json['colorCode'] as String
    ..fontCode = json['fontCode'] as num
    ..fontFamily = json['fontFamily'] as String
    ..hide = json['hide'] as bool
    ..path = json['path'] as String
    ..title = json['title'] as String
    ..code = json['code'] as String;
}

Map<String, dynamic> _$ApptreeToJson(Apptree instance) => <String, dynamic>{
      'children': instance.children,
      'colorCode': instance.colorCode,
      'fontCode': instance.fontCode,
      'fontFamily': instance.fontFamily,
      'hide': instance.hide,
      'path': instance.path,
      'title': instance.title,
      'code': instance.code
    };
