import 'package:calculator/bloc/calculator_bloc/calcuator_bloc.dart';
import 'package:calculator/utils/dimensions.dart';
import 'package:flutter/material.dart';
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
                    textAlign: TextAlign.right,
                    controller: _textEditingController,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Builder(builder: (context) {
                return _SimpleCalculator(
                  getVal: (val) {
                    BlocProvider.of<CalcuatorBloc>(context, listen: false)
                        .add(AddExpression(expression: val));
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleCalculator extends StatelessWidget {
  final Function(String) getVal;

  const _SimpleCalculator({this.getVal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              _CustomCalButton(
                val: "sin",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
              _CustomCalButton(
                val: "cos",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
              _CustomCalButton(
                val: "tan",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
              _CustomCalButton(
                val: "sec",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
              _CustomCalButton(
                val: "cosec",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _CustomCalButton(
                val: "cot",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
              _CustomCalButton(
                val: "log",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
              _CustomCalButton(
                val: "ln",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
              _CustomCalButton(
                val: "(",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
              _CustomCalButton(
                val: ")",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _CustomCalButton(
                val: "√x",
                mappedKey: "√",
                colorType: ColorType.GREY,
                getVal: getVal,
              ),
              _CustomCalButton(
                val: "c",
                getVal: getVal,
                colorType: ColorType.RED,
              ),
              _CustomCalButton(
                val: "d",
                widget: Icon(
                  Icons.backspace,
                  color: Colors.orange,
                ),
                getVal: getVal,
                colorType: ColorType.RED,
              ),
              _CustomCalButton(
                val: "%",
                getVal: getVal,
                colorType: ColorType.RED,
              ),
              _CustomCalButton(
                val: "÷",
                colorType: ColorType.RED,
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
                colorType: ColorType.GREY,
              ),
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
              _CustomCalButton(
                val: "x",
                colorType: ColorType.RED,
                getVal: getVal,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _CustomCalButton(
                val: "1/x",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
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
              _CustomCalButton(
                val: "-",
                colorType: ColorType.RED,
                getVal: getVal,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _CustomCalButton(
                val: "π",
                getVal: getVal,
                colorType: ColorType.GREY,
              ),
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
              _CustomCalButton(
                val: "+",
                colorType: ColorType.RED,
                getVal: getVal,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _CustomCalButton(
                val: "Xⁿ",
                colorType: ColorType.GREY,
                getVal: getVal,
              ),
              _CustomCalButton(
                val: "e",
                getVal: getVal,
              ),
              _CustomCalButton(
                val: "0",
                getVal: getVal,
              ),
              _CustomCalButton(
                val: ".",
                getVal: getVal,
              ),
              _CustomCalButton(
                enableBgColor: true,
                val: "=",
                colorType: ColorType.RED,
                getVal: getVal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum ColorType { GREY, BLACK, RED }

class _CustomCalButton extends StatelessWidget {
  final ColorType colorType;
  final Widget widget;
  final String val;
  final String mappedKey;
  final bool enableBgColor;
  final Function(String) getVal;
  const _CustomCalButton(
      {this.val,
      this.getVal,
      this.widget,
      this.mappedKey,
      this.colorType,
      this.enableBgColor});

  Color _mapColor(ColorType colorType) {
    switch (colorType) {
      case ColorType.BLACK:
        return Colors.black;
      case ColorType.GREY:
        return Colors.grey;
      case ColorType.RED:
        return Colors.orange;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Material(
          color: enableBgColor ?? false ? Colors.orange : Colors.white,
          elevation: 10,
          borderRadius: BorderRadius.circular(900),
          child: InkWell(
            onTap: () {
              if (getVal != null) getVal(mappedKey ?? val);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              alignment: Alignment(0, 0),
              child: widget ??
                  Text(
                    val,
                    style: TextStyle(
                      fontSize: colorType == ColorType.GREY ? 14 : 28,
                      color: enableBgColor ?? false
                          ? Colors.white
                          : _mapColor(colorType),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
