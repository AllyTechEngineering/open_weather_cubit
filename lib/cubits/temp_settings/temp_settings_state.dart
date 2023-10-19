part of 'temp_settings_cubit.dart';

enum TempUnit {
  celsius,
  fahrenheit,
}

class TempSettingsState extends Equatable {
  final TempUnit tempUnit;
  TempSettingsState({
    this.tempUnit = TempUnit.celsius,
  });

  factory TempSettingsState.initial() {
    return TempSettingsState();
  }
// Method overriding using @overide is the practice of a child class redefining a method inherited from its parent class.
// this method is used to check if the objects are the same or !same.
  @override
  List<Object> get props {
    return [tempUnit];
  }

  @override
  String toString() => 'TempSettingsState(tempUnit: $tempUnit)';


  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}
