import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather_cubit/models/weather.dart';
import 'package:open_weather_cubit/models/custom_error.dart';
import 'package:open_weather_cubit/repositories/weather_repository.dart';

part 'weather_state.dart';
/// # WeatherCubit
/// * https://pub.dev/documentation/bloc/latest/bloc/Cubit-class.html
/// * https://pub.dev/documentation/bloc/latest/bloc/Cubit-class.html#instance-methods
/// * https://pub.dev/documentation/bloc/latest/bloc/Cubit-class.html#instance-properties
/// * WeatherCubit extends WeatherState
/// * Definition of extends: You can inherit from or extend a class using the extends keyword. This allows you share properties and methods between classes that are similar, but not exactly the same.

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository})
      : super(WeatherState.initial());

  Future<void> fetchWeather(String city) async {
    // loading is in the enum in WeatherState
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final Weather weather = await weatherRepository.fetchWeather(city);
// loaded is in the enum in WeatherState
      emit(state.copyWith(
        status: WeatherStatus.loaded,
        weather: weather,
      ));
      // print('state: $state');
    } on CustomError catch (e) {
      emit(state.copyWith(
        // error is in the enum in WeatherState
        status: WeatherStatus.error,
        error: e,
      ));
      // print('state: $state');
    }
  } //Future<void>fetchWeather
} //class WeatherCubit
