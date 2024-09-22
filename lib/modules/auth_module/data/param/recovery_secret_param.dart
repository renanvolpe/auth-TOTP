// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class RecoverySecretParam {
   String username;
  String password;
  String code;
  RecoverySecretParam({
    required this.username,
    required this.password,
    required this.code,
  });

  RecoverySecretParam copyWith({
    String? username,
    String? password,
    String? code,
  }) {
    return RecoverySecretParam(
      username: username ?? this.username,
      password: password ?? this.password,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'code': code,
    };
  }

  factory RecoverySecretParam.fromMap(Map<String, dynamic> map) {
    return RecoverySecretParam(
      username: map['username'] as String,
      password: map['password'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecoverySecretParam.fromJson(String source) => RecoverySecretParam.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RecoverySecretParam(username: $username, password: $password, code: $code)';

  @override
  bool operator ==(covariant RecoverySecretParam other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password &&
      other.code == code;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ code.hashCode;
}
