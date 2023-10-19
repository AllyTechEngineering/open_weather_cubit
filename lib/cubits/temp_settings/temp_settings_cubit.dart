import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'temp_settings_state.dart';

/// * https://pub.dev/documentation/bloc/latest/bloc/Cubit-class.html
/// * https://pub.dev/documentation/bloc/latest/bloc/Cubit-class.html#instance-methods
/// * https://pub.dev/documentation/bloc/latest/bloc/Cubit-class.html#instance-properties
/// * Definition of extends: You can inherit from or extend a class using the extends keyword. This allows you share properties and methods between classes that are similar, but not exactly the same.

class TempSettingsCubit extends Cubit<TempSettingsState> {
  TempSettingsCubit() : super(TempSettingsState.initial());

  void toggleTempUnit() {
    emit(
      state.copyWith(
        tempUnit: state.tempUnit == TempUnit.celsius
            ? TempUnit.fahrenheit
            : TempUnit.celsius,
      ),
    );
    // print('TempSettingsCubit tempUnit; $state');
  } //void toggleTempUnit
} //class TempSettingsCubit
