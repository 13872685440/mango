import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission {
    Permission();

    String permissionId;
    String permissionName;
    
    factory Permission.fromJson(Map<String,dynamic> json) => _$PermissionFromJson(json);
    Map<String, dynamic> toJson() => _$PermissionToJson(this);
}
