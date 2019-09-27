import 'package:json_annotation/json_annotation.dart';
import "posts.dart";
import "role.dart";
import "apptree.dart";
part 'user_bean_info.g.dart';

@JsonSerializable()
class User_bean_info {
    User_bean_info();

    String id;
    String name;
    String password;
    List<Posts> posts;
    List<Role> roles;
    String salt;
    String status;
    String token;
    List userRoles;
    String username;
    String avatar;
    List<Apptree> apps;
    
    factory User_bean_info.fromJson(Map<String,dynamic> json) => _$User_bean_infoFromJson(json);
    Map<String, dynamic> toJson() => _$User_bean_infoToJson(this);
}
