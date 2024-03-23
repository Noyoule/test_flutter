part of 'user_bloc.dart';

abstract class UserState {}

class InitialState extends UserState {
  InitialState();
}

class GettingUsersState extends UserState{
  GettingUsersState();
}

class UserGettedState extends UserState{
  final List<UserModel> users;
  UserGettedState({required this.users});
}