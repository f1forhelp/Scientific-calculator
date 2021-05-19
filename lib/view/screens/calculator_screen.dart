import 'package:calculator/bloc/calculator_bloc/calcuator_bloc.dart';
import 'package:calculator/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalCulatorScreen extends StatefulWidget {
  @override
  _CalCulatorScreenState createState() => _CalCulatorScreenState();
}

class _CalCulatorScreenState extends State<CalCulatorScreen> {
  TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => CalcuatorBloc(),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: BlocListener<CalcuatorBloc, CalcuatorState>(
                listener: (context, state) {
                  _textEditingController.text = state.expression;
                },
                child: Center(
                  child: TextField(
                    controller: _textEditingController,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Builder(builder: (context) {
                return PageView(
                  children: [
                    _SimpleCalculator(
                      getVal: (val) {
                        if (val == "0") {
                          BlocProvider.of<CalcuatorBloc>(context, listen: false)
                              .add(AddExpression(expression: ""));
                          _textEditingController.clear();
                        } else
                          BlocProvider.of<CalcuatorBloc>(context, listen: false)
                              .add(AddExpression(expression: val));
                      },
                    ),
                    _Scientific(
                      getVal: (val) {
                        print(val);
                      },
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _Scientific extends StatelessWidget {
  final Function(String) getVal;

  const _Scientific({this.getVal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _CustomCalButton(
                      val: "sin",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "cos",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "tan",
                      getVal: getVal,
                    ),
                  ],
                ),
              ),
              RawKeyboardListener(
                focusNode: FocusNode(),
                child: Text(""),
                onKey: (key) {
                  print(key.isKeyPressed(LogicalKeyboardKey.backspace));
                },
              ),
              Expanded(
                child: Row(
                  children: [
                    _CustomCalButton(
                      val: "√",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "log",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "Xⁿ",
                      getVal: getVal,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    _CustomCalButton(
                      val: "EXP",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "RAD",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "e",
                      getVal: getVal,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    _CustomCalButton(
                      val: "x!",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "π",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "=",
                      getVal: getVal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _CustomCalButton(
                val: "+",
                getVal: getVal,
              ),
              _CustomCalButton(
                val: "-",
                getVal: getVal,
              ),
              _CustomCalButton(
                val: "x",
                getVal: getVal,
              ),
              _CustomCalButton(
                val: "/",
                getVal: getVal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SimpleCalculator extends StatelessWidget {
  final Function(String) getVal;

  const _SimpleCalculator({this.getVal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _CustomCalButton(
                      val: "1",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "2",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "3",
                      getVal: getVal,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    _CustomCalButton(
                      val: "4",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "5",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "6",
                      getVal: getVal,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    _CustomCalButton(
                      val: "7",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "8",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "9",
                      getVal: getVal,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    _CustomCalButton(
                      val: ".",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "0",
                      getVal: getVal,
                    ),
                    _CustomCalButton(
                      val: "=",
                      getVal: getVal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _CustomCalButton(
                val: "+",
                getVal: getVal,
              ),
              _CustomCalButton(
                val: "-",
                getVal: getVal,
              ),
              _CustomCalButton(
                val: "x",
                getVal: getVal,
              ),
              _CustomCalButton(
                val: "/",
                getVal: getVal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomCalButton extends StatelessWidget {
  final String val;
  final Function(String) getVal;
  const _CustomCalButton({this.val, this.getVal});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: () {
            if (getVal != null) getVal(val);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            alignment: Alignment(0, 0),
            child: Text(
              val,
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}
