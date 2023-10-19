import 'package:equatable/equatable.dart';

/// Models are used to determine the structure of the data - API responses.
/// Models declare variables, data types and can have methods to add some functionality to the data.
///
/// Provides a custom error model for errors that have occured in the weather app

class CustomError extends Equatable {
  final String errMsg;
  CustomError({
    /// The empty screen is the defualt initial value of the error
    this.errMsg = ' ',
  });

  @override
  List<Object> get props => [errMsg];

  // @override
  // String toString() => 'CustomError(errMsg: $errMsg)';
}
