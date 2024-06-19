// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthUser {
  final String uid;
  final String email;
  final String fullName;
  final String priority;

  const AuthUser({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.priority,
  });

  AuthUser copyWith({
    String? uid,
    String? email,
    String? fullName,
    String? priority,
  }) {
    return AuthUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      priority: priority ?? this.priority,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'priority': priority,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      uid: (map["uid"] ?? '') as String,
      email: (map["email"] ?? '') as String,
      fullName: (map["fullName"] ?? '') as String,
      priority: (map["priority"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthUser.fromJson(String source) =>
      AuthUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthUser(uid: $uid, email: $email, fullName: $fullName, priority: $priority)';
  }

  @override
  bool operator ==(covariant AuthUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.fullName == fullName &&
        other.priority == priority;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        fullName.hashCode ^
        priority.hashCode;
  }
}
