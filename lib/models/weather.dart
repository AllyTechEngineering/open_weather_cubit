import 'package:equatable/equatable.dart';

/// Models are used to determine the structure of the data - API responses.
/// Models declare variables, data types and can have methods to add some functionality to the data.

class Weather extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String name;
  final String country;
  final DateTime lastUpdated;
  /// Constructors are used to initialize the object of the class.
  Weather({
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.name,
    required this.country,
    required this.lastUpdated,
  });

  /// factory constructor creates a Weather object from the read JSON
  factory Weather.fromJson(Map<String, dynamic> json) {
    /// first values of the weather list assigned to the variable weather
    final weather = json['weather'][0];

    /// variable main stores the main object
    final main = json['main'];

    /// create the weather instance and return it
    return Weather(
        description: weather['description'],
        icon: weather['icon'],
        temp: main['temp'],
        tempMin: main['temp_min'],
        tempMax: main['temp_max'],

        /// the name and country in DirectGeocoding will be used here
        name: '',
        country: '',

        /// this is the local time stamp
        lastUpdated: DateTime.now());
  } //factory Weather
  /// factory constructor is used for the inital value of WeatherState makes this non nullable to help with issues latter
  factory Weather.initial() => Weather(
        description: '',
        icon: '',
        temp: 100.0,
        tempMin: 100.0,
        tempMax: 100.0,
        name: '',
        country: '',
        lastUpdated: DateTime(1970),
      );

  @override
  List<Object> get props {
    return [
      description,
      icon,
      temp,
      tempMin,
      tempMax,
      name,
      country,
      lastUpdated,
    ];
  }

  // @override
  // String toString() {
  //   return 'Weather(description: $description, icon: $icon, temp: $temp, tempMin: $tempMin, tempMax: $tempMax, name: $name, country: $country, lastUpdated: $lastUpdated)';
  // }

  Weather copyWith({
    String? description,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    String? name,
    String? country,
    DateTime? lastUpdated,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      name: name ?? this.name,
      country: country ?? this.country,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
} //class Weather
