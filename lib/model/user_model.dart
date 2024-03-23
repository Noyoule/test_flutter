class UserModel {
  final String? gender;
  final Name? name;
  final Location location;
  final String? email;
  final String? phone;
  final String? cell;
  final String? nat;
  final Dob? dob;
  final Registered registered;
  final Id? id;
  final Picture? picture;

  UserModel(
      {required this.gender,
      required this.name,
      required this.location,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.dob,
      required this.registered,
      required this.id,
      required this.picture});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        gender: json['gender'],
        name: Name.fromJson(json['name']),
        location: Location.fromJson(json['location']),
        email: json['email'],
        phone: json['phone'],
        cell: json['cell'],
        nat: json['nat'],
        dob: Dob.fromJson(json['dob']),
        registered: Registered.fromJson(json['registered']),
        id: Id.fromJson(json['id']),
        picture: Picture.fromJson(json['picture']));
  }
}

class Name {
  final String? title;
  final String? first;
  final String? last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class Location {
  final String? city;
  final String? state;
  final String? country;
  final Street? street;
  final Coordinates? coordinates;
  final TimeZone? timezone;

  Location(
      {required this.city,
      required this.state,
      required this.country,
      required this.street,
      required this.coordinates,
      required this.timezone});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        city: json['city'],
        state: json['state'],
        country: json['country'],
        street: Street.fromJson(json['street']),
        coordinates: Coordinates.fromJson(json['coordinates']),
        timezone: TimeZone.fromJson(json['timezone']));
  }
}

class Street {
  final int? number;
  final String? name;

  Street({required this.number, required this.name});

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(number: json["number"], name: json["name"]);
  }
}

class Coordinates {
  final String? latitude;
  final String? longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
        latitude: json["latitude"], longitude: json["longitude"]);
  }
}

class TimeZone {
  final String? offset;
  final String? description;

  TimeZone({required this.offset, required this.description});

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(offset: json["offset"], description: json["description"]);
  }
}

class Dob {
  final String? date;
  final int? age;

  Dob({required this.date, required this.age});

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(date: json["date"], age: json["age"]);
  }
}

class Registered {
  final String? date;
  final int? age;

  Registered({required this.date, required this.age});

  factory Registered.fromJson(Map<String, dynamic> json) {
    return Registered(date: json["date"], age: json["age"]);
  }
}

class Id {
  final String? name;
  final String? value;

  Id({required this.name, required this.value});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(name: json["name"], value: json["value"]);
  }
}

class Picture {
  final String? medium;

  Picture({required this.medium});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(medium: json["medium"]);
  }
}
