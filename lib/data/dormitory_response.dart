import 'package:json_annotation/json_annotation.dart';

part 'dormitory_response.g.dart';

@JsonSerializable()
class DormitoryMeals {
  @JsonKey(name: '아침(빵x)')
  final String meal;

  //Target of URI hasn't been generated: 'dormitory.g.dart'.
// Try running the generator that will generate the file referenced by the URI.

  DormitoryMeals(
    this.meal,
  );

  factory DormitoryMeals.fromJson(Map<String, dynamic> srcJson) =>
      _$DormitoryMealsFromJson(srcJson);

  // Map<String, dynamic> toJson() => _$EntityToJson(this);
}
