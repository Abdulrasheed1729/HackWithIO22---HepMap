import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final String? email;

  @HiveField(1)
  final String id;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? username;

  const User({
    this.email,
    required this.id,
    this.name,
    this.username,
  });

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  User copywith({
    String? email,
    required String id,
    String? name,
    String? username,
  }) {
    return User(
      id: this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      username: username ?? this.username,
    );
  }

  @override
  List<Object?> get props => [email, id, name, username];
}
