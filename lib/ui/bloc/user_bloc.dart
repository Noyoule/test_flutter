import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/model/model.dart';
import 'package:test_flutter/service/locale_data_source.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LocaleDataSource source;
  UserBloc({required this.source}) : super(InitialState()) {
    on<GetUserEvent>(_getUserHandler);
    on<CreateUserEvent>(_createUserHandler);
    on<UpdateUserEvent>(_updateTaskHandler);
    on<DeleteUserEvent>(_deleteUserHandler);
  }

  Future<void> _getUserHandler(
      GetUserEvent event, Emitter<UserState> emitter) async {
    emit(GettingUsersState());
    List<User> users =
        await source.getData(event.lastRecuperationIndex, event.limit);
    emit(UserGettedState(users: users));
  }

  Future<void> _createUserHandler(
      CreateUserEvent event, Emitter<UserState> emitter) async {
    var user = await source.createUser(
        nat: event.nat,
        cell: event.cell,
        title: event.title,
        first: event.first,
        lastName: event.lastName,
        gender: event.gender,
        phone: event.gender,
        email: event.email,
        city: event.city,
        country: event.country,
        state: event.state,
        latitude: event.latitude,
        longitude: event.longitude,
        streetName: event.streetName,
        streetNumber: event.streetNumber,
        dateOfBirth: event.dateOfBirth,
        registrationDate: event.registrationDate,
        idValue: event.idValue,
        idName: event.idName,
        picturePath: event.picturePath,
        timezoneOffset: event.timezoneOffset,
        timezoneDescription: event.timezoneDescription);
    emit(UserCreatedState(user: user));
  }

  Future<void> _updateTaskHandler(
      UpdateUserEvent event, Emitter<UserState> emitter) async {
    var user = await source.updateUser(
        id: event.id,
        pictureSource: event.pictureSource,
        nat: event.nat,
        cell: event.cell,
        title: event.title,
        first: event.first,
        lastName: event.lastName,
        gender: event.gender,
        phone: event.gender,
        email: event.email,
        city: event.city,
        country: event.country,
        state: event.state,
        latitude: event.latitude,
        longitude: event.longitude,
        streetName: event.streetName,
        streetNumber: event.streetNumber,
        dateOfBirth: event.dateOfBirth,
        registrationDate: event.registrationDate,
        idValue: event.idValue,
        idName: event.idName,
        picturePath: event.picturePath,
        timezoneOffset: event.timezoneOffset,
        timezoneDescription: event.timezoneDescription);
    emit(UserUpdateState(user: user, index: event.index));
  }

  Future<void> _deleteUserHandler(
      DeleteUserEvent event, Emitter<UserState> emitter) async {
    await source.deleteUser(
      id: event.id,
    );
    emit(UserDeletedSate(index: event.index));
  }
}
