// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginParam {
  String username;
  String password;
  String totp_code;
  LoginParam({
    required this.username,
    required this.password,
    required this.totp_code,
  });

  LoginParam copyWith({
    String? username,
    String? password,
    String? totp_code,
  }) {
    return LoginParam(
      username: username ?? this.username,
      password: password ?? this.password,
      totp_code: totp_code ?? this.totp_code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'totp_code': totp_code,
    };
  }

  factory LoginParam.fromMap(Map<String, dynamic> map) {
    return LoginParam(
      username: map['username'] as String,
      password: map['password'] as String,
      totp_code: map['totp_code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParam.fromJson(String source) => LoginParam.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginParam(username: $username, password: $password, totp_code: $totp_code)';

  @override
  bool operator ==(covariant LoginParam other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password &&
      other.totp_code == totp_code;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ totp_code.hashCode;
}
