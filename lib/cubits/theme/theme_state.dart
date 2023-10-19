part of 'theme_cubit.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeState extends Equatable {
  final AppTheme apptheme;
  ThemeState({
    this.apptheme = AppTheme.light,
  });

  factory ThemeState.inital() {
    return ThemeState();
  }

  @override
  List<Object> get props => [apptheme];

  @override
  String toString() => 'ThemeState(apptheme: $apptheme)';

  ThemeState copyWith({
    AppTheme? apptheme,
  }) {
    return ThemeState(
      apptheme: apptheme ?? this.apptheme,
    );
  }
}//class ThemeState
