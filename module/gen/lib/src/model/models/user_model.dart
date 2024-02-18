import 'package:equatable/equatable.dart';
import 'package:gen/src/model/abstract/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User with EquatableMixin {
  UserModel(
      {required dynamic name,
      required dynamic email,
      required dynamic age,
      required dynamic gender})
      : super(name: name, email: email, age: age, gender: gender);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [name, email, age, gender];

  UserModel copyWith({
    String? name,
    String? email,
    int? age,
    String? gender,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      gender: gender ?? this.gender,
    );
  }
}
