import 'package:flutter/material.dart';
import 'package:open_weather_cubit/cubits/weather/weather_cubit.dart';
import 'package:open_weather_cubit/pages/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              _city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
              print('city: $_city');
              if (_city != null) {
                context.read<WeatherCubit>().fetchWeather(_city!);
              }
            },
          )
        ],
      ),
      body: _showWeather(),
    );
  } //Widget build

  /// Create _showWeather() method that returns widgets
  ///
  /// See Video at 65. HomePage widget 1 - initial, loading, error
  ///
  /// If there is an error a dialog will be displayed otherwise a widget will be displayed
  ///
  /// Need BlocListener and BlocBuilder for this method but we can use BlocConsumer to simplify the code. We will return BlocConsumer
  ///
  Widget _showWeather() {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        /// In the case of an error we will display an AlertDialog.
        ///
        /// '''return AlertDialog(
        /// content: Text(state.error.errMsg),'''
        ///
        /// listener callback receives BuildContext and WeatherState as arguments.
        ///
        if (state.status == WeatherStatus.error) {
          showDialog(
            context: context,
            builder: (context) {
              /// Displays errMessage property of state.error from the builder callback.
              ///
              return AlertDialog(
                content: Text(state.error.errMsg),
              );
            },
          );
        }
      },

      /// The builder recieves BuildContext and WeatherState as arguments.
      ///
      /// If the state.status is the same as WeatherStatus.initial - no search has occured yet. Display Select a City string.
      ///
      /// If the state.status is the same as WeatherState.loading, the data is being read to display the CircularProgressIndicator.
      ///
      /// For the rest of the cases (states?) the data is loaded normally. Display the weather data.
      ///
      builder: (context, state) {
        ///State: initial
        ///
        if (state.status == WeatherStatus.initial) {
          return const Center(
            child: Text(
              'Select a city',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        ///This is for an edge case when an error occurs at the start of the app
        ///
        if (state.status == WeatherStatus.error && state.weather.name == '') {
          return const Center(
            child: Text(
              'Select a city',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        ///State: loading
        ///
        if (state.status == WeatherStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        ///State: loaded normally
        ///
        return Center(
          child: Text(
            state.weather.name,
            style: TextStyle(fontSize: 18.0),
          ),
        );
      },
    );
  }
} //class _HomePageState
