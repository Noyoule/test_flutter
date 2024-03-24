part of 'user_bloc.dart';

abstract class UserState {}

class InitialState extends UserState {
  InitialState();
}

class GettingUsersState extends UserState {
  GettingUsersState();
}

class UserGettedState extends UserState {
  final List<User> users;
  UserGettedState({required this.users});
}

class UserCreatedState extends UserState {
  final User user;
  UserCreatedState({required this.user});
}

class UserUpdateState extends UserState {
  final User user;
  final int index;
  UserUpdateState({required this.user, required this.index});
}

class UserDeletedSate extends UserState {
  final int index;
  UserDeletedSate({required this.index});
}
