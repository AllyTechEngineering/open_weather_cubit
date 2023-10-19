part of 'weather_cubit.dart';

/// Enumerated types, often called enumerations or enums, are a special kind of class used to represent a fixed number of constant values.
/// Access the enumerated values like any other static variable:

enum WeatherStatus {
  initial,
  loading,
  loaded,
  error,
}

class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather weather;
  final CustomError error;
  WeatherState({
    required this.status,
    required this.weather,
    required this.error,
  });

  /// factory constructor for weather_state.dart
  factory WeatherState.initial() {
    return WeatherState(
      // initial is in the enum in WeatherState
        status: WeatherStatus.initial,
        weather: Weather.initial(),
        error: CustomError());
  } //factory WeatherState

  @override
  List<Object> get props => [status, weather, error];

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    CustomError? error,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }

  
} //class WeatherState
