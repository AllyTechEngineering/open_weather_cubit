import 'package:flutter/material.dart';
import 'package:open_weather_cubit/constants/constants.dart';
import 'package:open_weather_cubit/cubits/temp_settings/temp_settings_cubit.dart';
import 'package:open_weather_cubit/cubits/weather/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_cubit/widgets/error_dialog.dart';
import 'package:recase/recase.dart';
import 'package:open_weather_cubit/pages/home_page.dart';


/// # Create showWeather() method that returns widgets.
/// * See Video at 65. HomePage widget 1 - initial, loading, error.
/// * If there is an error a dialog will be displayed otherwise a widget will be displayed.
/// * Need BlocListener and BlocBuilder for this method but we can use BlocConsumer to simplify the code. We will return BlocConsumer.
///
/// # showTemperature() method that returns C or F temps
/// * receives a double type temperature.
/// * To get the special symbols for C and F press ctrl + cmd + space and type in what you are looking for.
///
/// # formatText() method that returns a Text Widget
/// * uses the recase widget to change the lower case network string to have the first letter upper case.
/// * provides other styling.


