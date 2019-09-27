import 'package:json_annotation/json_annotation.dart';

part 'apptree.g.dart';

@JsonSerializable()
class Apptree {
    Apptree();

    List children;
    String colorCode;
    num fontCode;
    String fontFamily;
    bool hide;
    String path;
    String title;
    String code;
    
    factory Apptree.fromJson(Map<String,dynamic> json) => _$ApptreeFromJson(json);
    Map<String, dynamic> toJson() => _$ApptreeToJson(this);
}
