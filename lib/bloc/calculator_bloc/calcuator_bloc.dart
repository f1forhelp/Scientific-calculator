import 'dart:async';

import 'package:bloc/bloc.dart';
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
      if (event.expression == "=") {
        print(Parser().parse(state.expression).simplify());
        yield state.copyWith(
            expression: Parser()
                .parse(state.expression)
                .evaluate(EvaluationType.REAL, ContextModel())
                .toString());
      } else {
        yield state.copyWith(expression: state.expression + event.expression);
      }
    }
  }
}
