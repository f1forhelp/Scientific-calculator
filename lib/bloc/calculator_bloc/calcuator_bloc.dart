import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calculator/utils/helper.dart';
import 'package:equatable/equatable.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';

part 'calcuator_event.dart';
part 'calcuator_state.dart';

class CalcuatorBloc extends Bloc<CalcuatorEvent, CalcuatorState> {
  CalcuatorBloc() : super(CalcuatorState(expression: ""));

  @override
  Stream<CalcuatorState> mapEventToState(
    CalcuatorEvent event,
  ) async* {
    if (event is AddExpression) {
      if (event.expression == "c") {
        yield state.copyWith(expression: "");
      } else if (event.expression == "=") {
        yield state.copyWith(
            expression: Parser()
                .parse(Helper.getTokenFromString(str: state.expression))
                .evaluate(EvaluationType.REAL, ContextModel())
                .toString());
      } else if (event.expression == "d") {
        yield state.copyWith(
            expression: state.expression.substring(
                0,
                state.expression.length > 0
                    ? (state.expression.length - 1)
                    : 0));
      } else {
        yield state.copyWith(expression: state.expression + event.expression);
      }
    }
  }
}
