import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({ 
    Key? key, 
    required this.controller,
    required this.placeholder,
  }) : super(key: key);

  final TextEditingController controller;
  final String placeholder;

  @override  
   State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
  
    return TextField(
      controller: widget.controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        hintText: 'Exemplo: 21', 
        border: OutlineInputBorder(),
        label: Text(widget.placeholder),
      ),
    );
  }
}