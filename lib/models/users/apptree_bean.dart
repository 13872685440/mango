import 'package:json_annotation/json_annotation.dart';

part 'apptree_bean.g.dart';

@JsonSerializable()
class Apptree_bean {
    Apptree_bean();

    String clc;
    String code;
    String component;
    String ct;
    String id;
    bool isLeaf;
    String name;
    String superior_code;
    String superior_name;
    String tmpId;
    String wn;
    num xh;
    
    factory Apptree_bean.fromJson(Map<String,dynamic> json) => _$Apptree_beanFromJson(json);
    Map<String, dynamic> toJson() => _$Apptree_beanToJson(this);
}
