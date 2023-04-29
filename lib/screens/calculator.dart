import 'package:flutter/material.dart';
import 'package:flutter_app/utils/operations-enum.dart';
import 'package:flutter_app/ui/button.dart';
import 'package:flutter_app/ui/text_input.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override  
   State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  double result = 0.0;
  
  void _calculate(Operations action) {
    double firstNumber = double.parse(firstNumberController.text);
    double secondNumber = double.parse(secondNumberController.text);

    setState(() {
      switch(action) {
        case Operations.sum: 
          result = firstNumber + secondNumber;
          break;
        case Operations.subtraction: 
          result = firstNumber - secondNumber;
          break;
        case Operations.division: 
          result = firstNumber / secondNumber;
          break;
        case Operations.multiplication: 
          result = firstNumber * secondNumber;
          break;
        default:
          result = 0.0;
          break;
      }
    });
  }

    @override
  Widget build(BuildContext context) {
    final tenPercentOfScreen = (MediaQuery.of(context).size.width / 100) * 10;

    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: tenPercentOfScreen,
          horizontal: tenPercentOfScreen > 64 ? tenPercentOfScreen * 1.5 : tenPercentOfScreen,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Input(controller: firstNumberController, placeholder: 'Primeiro número'),
            const SizedBox(height: 8.0),
            Input(controller: secondNumberController, placeholder: 'Segundo número'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(label: 'Somar', onPress: () => _calculate(Operations.sum)),
                Button(label: 'Subtrair', onPress: () => _calculate(Operations.subtraction)),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(label: 'Dividir', onPress: () => _calculate(Operations.division)),
                Button(label: 'Multiplicar', onPress: () => _calculate(Operations.multiplication)),
              ],
            ),
            const SizedBox(height: 16.0),
            Divider(height: 1.0, color: Colors.grey),
            const SizedBox(height: 16.0),
            Text('Resultado: $result', style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}