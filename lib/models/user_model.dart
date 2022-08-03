import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final String id;
  final String? name;
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

  @override
  List<Object?> get props => [email, id, name, username];
}
