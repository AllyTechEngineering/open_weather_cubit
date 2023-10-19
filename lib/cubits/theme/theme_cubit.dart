import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather_cubit/constants/constants.dart';
import 'package:open_weather_cubit/cubits/weather/weather_cubit.dart';

part 'theme_state.dart';

/// # ThemeCubit
/// * This cubit needs to listen to the WeatherCubit's state change
/// * Needs an instance of WeatherCubit


class ThemeCubit extends Cubit<ThemeState> {
  late final StreamSubscription weatherSubscription;

  final WeatherCubit weatherCubit;

  ThemeCubit({
    required this.weatherCubit,
  }) : super(ThemeState.inital()) {
    weatherSubscription =
        weatherCubit.stream.listen((WeatherState weatherState) {
      print('This is weatherState.weather.temp: ${weatherState.weather.temp}');
      if (weatherState.weather.temp > kWarmOrNot) {
        print('Entered into if where temp is > 20');
        emit(state.copyWith(apptheme: AppTheme.light));
      } else {
        print('Entered into else where temp is < 20');
        emit(state.copyWith(apptheme: AppTheme.dark));
      }
    });
  }

  @override
  Future<void> close() {
    weatherSubscription.cancel();
    return super.close();
  }
} //class ThemeCubit
