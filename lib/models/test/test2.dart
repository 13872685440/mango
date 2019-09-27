import 'package:json_annotation/json_annotation.dart';

part 'test2.g.dart';

@JsonSerializable()
class Test2 {
    Test2();

    String simple;
    String id;
    
    factory Test2.fromJson(Map<String,dynamic> json) => _$Test2FromJson(json);
    Map<String, dynamic> toJson() => _$Test2ToJson(this);
}
