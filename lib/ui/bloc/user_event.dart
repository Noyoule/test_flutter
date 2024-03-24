part of 'user_bloc.dart';

abstract class UserEvent {}

class GetUserEvent extends UserEvent {
  final int limit;
  final int lastRecuperationIndex;
  GetUserEvent({required this.lastRecuperationIndex, required this.limit});
}

class CreateUserEvent extends UserEvent {
  final String nat;
  final String cell;
  final String title;
  final String first;
  final String lastName;
  final String gender;
  final String phone;
  final String email;
  final String city;
  final String country;
  final String state;
  final String latitude;
  final String longitude;
  final String streetName;
  final String streetNumber;
  final DateTime dateOfBirth;
  final DateTime registrationDate;
  final String idValue;
  final String idName;
  final String picturePath;
  final String timezoneOffset;
  final String timezoneDescription;

  CreateUserEvent({
    required this.nat,
    required this.cell,
    required this.title,
    required this.first,
    required this.lastName,
    required this.gender,
    required this.phone,
    required this.email,
    required this.city,
    required this.country,
    required this.state,
    required this.latitude,
    required this.longitude,
    required this.streetName,
    required this.streetNumber,
    required this.dateOfBirth,
    required this.registrationDate,
    required this.idValue,
    required this.idName,
    required this.picturePath,
    required this.timezoneOffset,
    required this.timezoneDescription,
  });
}

class UpdateUserEvent extends UserEvent {
  final int id;
  final String pictureSource;
  final int index;
  final String nat;
  final String cell;
  final String title;
  final String first;
  final String lastName;
  final String gender;
  final String phone;
  final String email;
  final String city;
  final String country;
  final String state;
  final String latitude;
  final String longitude;
  final String streetName;
  final String streetNumber;
  final DateTime dateOfBirth;
  final DateTime registrationDate;
  final String idValue;
  final String idName;
  final String picturePath;
  final String timezoneOffset;
  final String timezoneDescription;

  UpdateUserEvent({
    required this.id,
    required this.pictureSource,
    required this.index,
    required this.nat,
    required this.cell,
    required this.title,
    required this.first,
    required this.lastName,
    required this.gender,
    required this.phone,
    required this.email,
    required this.city,
    required this.country,
    required this.state,
    required this.latitude,
    required this.longitude,
    required this.streetName,
    required this.streetNumber,
    required this.dateOfBirth,
    required this.registrationDate,
    required this.idValue,
    required this.idName,
    required this.picturePath,
    required this.timezoneOffset,
    required this.timezoneDescription,
  });
}

class DeleteUserEvent extends UserEvent{
  final int id;
  final int index;
  DeleteUserEvent({required this.id, required this.index});
}


