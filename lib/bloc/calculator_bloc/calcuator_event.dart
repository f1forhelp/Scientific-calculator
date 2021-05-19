part of 'calcuator_bloc.dart';

@immutable
abstract class CalcuatorEvent {}

class AddExpression extends CalcuatorEvent {
  final String expression;

  AddExpression({this.expression});
}
