# open_weather_cubit

This project uses BLoC and this implementation uses cubits with a repository.
Any Cubit to Cubit state communication was handled using streams.

- StreamSubscription
    - Pros
        - Organzied, structured and easy to read and maintain.
        - TBD
    - Cons
        - It may get cluttered really fast and hard to scale on large apps.
        - Most remember to close StreamSubscriptions to avoid memory leaks. 
- BlocListener
    - Pros
        - Takes care of SteamSubscriptions internally.
        - Automatically closes SteamSubscriptions.
    - Cons
        - UI will get cluttered if many BlocListeners are needed.
        TBD

## BLoC Cubits Used
- TempSettingsCubit used to change for C to F.
- ThemeCubit listens to WeatherCubit and change theme based on location weather.
- WeatherCubit works with WeatherRepository to handle data from API call to openWeather.

## BLoC Repository Used
- WeatherRepository

##  Flutter BLoC Used
- RepositoryProvider for depenency injection.
- MultiBlocProvider to avoid nesting BlocProviders
- BlocProvider<WeatherCubit>
    - context.read<WeatherRepository> used to provide WeatherRepository to WeatherCubit.
- BlocProvider<TempSettingsCubit>
- BlocProvider<ThemeCubit>
    - context.read<WeatherCubit> used to provide WeatherCubit to ThemeCubit.

## Models Used
openWeather has deprecated using City and Country for weather look up and need lat and lon instead.
- Weather used to model the weather data for the UI.
- DirectGeocoding used to model the data for the lat and lon call to get city data.
- CustomError used to model the error messages.

## Services Used
- http_error_handler.dart
- WeatherApiServices (weather_api_services.dart)

## Other
- Used the flutter_dotenv package to hide the API key in a .env file and used gitignore to ensure the file was not made public on GitHub.

## Packages Used
- equatable: ^2.0.5
    - A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode.
- flutter_bloc: ^8.1.2
    - Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package.
- flutter_dotenv: ^5.1.0
    - Easily configure any flutter application with global variables using a `.env` file.
- http: ^1.1.0
    - A composable, multi-platform, Future-based API for HTTP requests.
- recase: ^4.1.0
    - Changes the case of the input text to the desire case convention.