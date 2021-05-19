part of 'calcuator_bloc.dart';

class CalcuatorState extends Equatable {
  final String expression;

  CalcuatorState({this.expression});

  @override
  List<Object> get props => [expression];

  CalcuatorState copyWith({
    String expression,
  }) {
    return CalcuatorState(
      expression: expression ?? this.expression,
    );
  }
}
