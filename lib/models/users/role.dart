import 'package:json_annotation/json_annotation.dart';
import "permission.dart";
part 'role.g.dart';

@JsonSerializable()
class Role {
    Role();

    List<Permission> permissions;
    String roleId;
    String roleName;
    
    factory Role.fromJson(Map<String,dynamic> json) => _$RoleFromJson(json);
    Map<String, dynamic> toJson() => _$RoleToJson(this);
}
