part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {}

class UpdateUser extends UserEvent {
  final User user;

  const UpdateUser({required this.user});

  @override
  List<Object> get props => [user];
}

/// This is for the future purpose since we don't
/// have the feature for deleteting [User] in the
/// current design.
class DeleteUser extends UserEvent {
  final User user;

  const DeleteUser({required this.user});

  @override
  List<Object> get props => [user];
}
