import 'package:equatable/equatable.dart';

/// This is the backbone of the app and the first thing created.
/// openweather api is deprecating looking up weather by name/country so we need two API calls.
///
/// First call is to get the lat and lon of the city.
/// Second is to get the data for that city and not use the city and country - use lat and lon.
///
/// We will not use the openweather api city and country?
/// Based on the first API call and uses name, lat, lon and country.
/// We need this to get the lat and lon of the city we are looking for.
///  
/// 
/// * Factory constructor: used to decode the JSON into a list of dynamic type.
///
/// * We only need the first JSON so this sets that up.
/// * ... 
/// '''dart final Map<String, dynamic> data = json[0];'''
///
/// * Create a DirectGeocoding instance and return it.
/// 
/// '''dart return DirectGeocoding(
/// name: data['name'],
/// lat: data['lat'],
/// lon: data['lon'],
/// country: data['country']);'''
///

class DirectGeocoding extends Equatable {
  final String name;
  final double lat;
  final double lon;
  final String country;
  DirectGeocoding({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

 /// This is the factory constructor mentioned above.
  factory DirectGeocoding.fromJson(List<dynamic> json) {
    /// We only need the first JSON so this sets that up
    final Map<String, dynamic> data = json[0];

    /// Create a DirectGeocoding instance and return it
    return DirectGeocoding(
        name: data['name'],
        lat: data['lat'],
        lon: data['lon'],
        country: data['country']);
  } //factory DirectGeocoding

  @override
  List<Object> get props => [name, lat, lon, country];

  @override
  String toString() {
    return 'DirectGeocoding(name: $name, lat: $lat, lon: $lon, country: $country)';
  }
} //class DirectGeocoding
