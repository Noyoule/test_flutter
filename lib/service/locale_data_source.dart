import 'package:flutter/foundation.dart';
import 'package:test_flutter/service/api_data_source.dart';

import '../model/model.dart';
import '../model/user_model.dart';

class LocaleDataSource {
  Future<void> saveDataFromApi() async {
    var apiSource = ApiDataSource();
    List<UserModel> users = await apiSource.getData(100);
    var now = DateTime.now();
    try {
      for (var user in users) {
        var dateOfBirth = DateTime.parse(user.dob!.date!);
        var dateOfRegistration = DateTime.parse(user.registered.date!);
        User(
                nat: user.nat,
                cell: user.cell,
                title: user.name!.title,
                first: user.name!.first,
                last: user.name!.last,
                gender: user.gender,
                phone: user.phone,
                email: user.email,
                location_city: user.location.city,
                location_contry: user.location.country,
                location_state: user.location.state,
                coordinate_lat: user.location.coordinates!.latitude,
                coordinate_long: user.location.coordinates!.longitude,
                street_name: user.location.street!.name,
                street_number: user.location.street!.number.toString(),
                date_of_birth: dateOfBirth.millisecondsSinceEpoch,
                age: now.year - dateOfBirth.year,
                date_of_registration: dateOfRegistration.millisecondsSinceEpoch,
                registration_age: now.year - dateOfRegistration.year,
                id_value: user.id!.value,
                id_name: user.id!.name,
                picture_path: user.picture!.medium,
                timezone_value: user.location.timezone!.offset,
                timezone_description: user.location.timezone!.description)
            .save();
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error saving data: $error");
      }
    }
  }

  Future<List<User>> getData(int lastRecuperationId, int limit) async {
    List<User> users = await User()
        .select()
        .id
        .between(lastRecuperationId, lastRecuperationId + limit)
        .toList();
    return users;
  }

  Future<List<User>> getDataWithSearch(String search) async {
    List<User> users = await User()
        .select()
        .first
        .contains(search)
        .or
        .last
        .contains(search)
        .or
        .email
        .contains(search)
        .or
        .location_state
        .contains(search)
        .or
        .location_city
        .contains(search)
        .or
        .location_contry
        .contains(search)
        .or
        .phone
        .contains(search)
        .or
        .cell
        .contains(search)
        .or
        .coordinate_long
        .contains(search)
        .or
        .coordinate_lat
        .contains(search)
        .toList();
    return users;
  }

  Future<User> createUser({
    required String nat,
    required String cell,
    required String title,
    required String first,
    required String lastName,
    required String gender,
    required String phone,
    required String email,
    required String city,
    required String country,
    required String state,
    required String latitude,
    required String longitude,
    required String streetName,
    required String streetNumber,
    required DateTime dateOfBirth,
    required DateTime registrationDate,
    required String idValue,
    required String idName,
    required String picturePath,
    required String timezoneOffset,
    required String timezoneDescription,
  }) async {
    var now = DateTime.now();
    var user = User(
        nat: nat,
        cell: cell,
        title: title,
        first: first,
        last: lastName,
        gender: gender,
        phone: phone,
        email: email,
        location_city: city,
        location_contry: country,
        location_state: state,
        coordinate_lat: latitude,
        coordinate_long: longitude,
        street_name: streetName,
        street_number: streetNumber,
        date_of_birth: dateOfBirth.millisecondsSinceEpoch,
        age: now.year - dateOfBirth.year,
        date_of_registration: registrationDate.millisecondsSinceEpoch,
        registration_age: now.year - registrationDate.year,
        id_value: idValue,
        id_name: idName,
        picture_path: picturePath,
        timezone_value: timezoneOffset,
        timezone_description: timezoneDescription,
        picture_source: "locale");
    var id = await user.save();
    user.id = id;
    return user;
  }

  Future<User> updateUser(
      {required int id,
      required String nat,
      required String cell,
      required String title,
      required String first,
      required String lastName,
      required String gender,
      required String phone,
      required String email,
      required String city,
      required String country,
      required String state,
      required String latitude,
      required String longitude,
      required String streetName,
      required String streetNumber,
      required DateTime dateOfBirth,
      required DateTime registrationDate,
      required String idValue,
      required String idName,
      required String picturePath,
      required String timezoneOffset,
      required String timezoneDescription,
      required String pictureSource}) async {
    var now = DateTime.now();
    var user = User(
        id: id,
        nat: nat,
        cell: cell,
        title: title,
        first: first,
        last: lastName,
        gender: gender,
        phone: phone,
        email: email,
        location_city: city,
        location_contry: country,
        location_state: state,
        coordinate_lat: latitude,
        coordinate_long: longitude,
        street_name: streetName,
        street_number: streetNumber,
        date_of_birth: dateOfBirth.millisecondsSinceEpoch,
        age: now.year - dateOfBirth.year,
        date_of_registration: registrationDate.millisecondsSinceEpoch,
        registration_age: now.year - registrationDate.year,
        id_value: idValue,
        id_name: idName,
        picture_path: picturePath,
        timezone_value: timezoneOffset,
        timezone_description: timezoneDescription,
        picture_source: pictureSource);
    await user.save();
    return user;
  }

  Future<void> deleteUser({
    required int id,
  }) async {
    await User().select().id.equals(id).delete();
  }
}
