import 'package:json_annotation/json_annotation.dart';

part 'posts.g.dart';

@JsonSerializable()
class Posts {
    Posts();

    String ct;
    String id;
    String leaf_code;
    String leaf_data;
    String organ_id;
    String organ_name;
    List permissions;
    String person_id;
    String person_name;
    String phone;
    List roles;
    String tmpId;
    num xh;
    
    factory Posts.fromJson(Map<String,dynamic> json) => _$PostsFromJson(json);
    Map<String, dynamic> toJson() => _$PostsToJson(this);
}
