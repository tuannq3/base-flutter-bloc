import '../../base/base_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'total_page')
  final String? authToken;

  LoginResponse(this.userId, this.authToken);
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
