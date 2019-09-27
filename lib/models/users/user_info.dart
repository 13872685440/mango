import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class User_info {
    User_info();

    String id;
    String name;
    String password;
    String salt;
    String service;
    String status;
    String token;
    List userRoles;
    String username;
    
    factory User_info.fromJson(Map<String,dynamic> json) => _$User_infoFromJson(json);
    Map<String, dynamic> toJson() => _$User_infoToJson(this);
}
