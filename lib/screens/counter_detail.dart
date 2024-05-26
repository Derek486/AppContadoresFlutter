import 'package:flutter/material.dart';

class CounterDetailScreen extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onChanged;

  const CounterDetailScreen({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CounterDetailScreen> createState() => _CounterDetailScreenState();
}

class _CounterDetailScreenState extends State<CounterDetailScreen> {
  late int _currentValue;

  @override
  void initState() {
    _currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Contador'),
      ),
      body: Center(
        child: Text(
          'Valor del Contador: $_currentValue',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'addButton',
            onPressed: () {
              setState(() {
                _currentValue++;
              });
              widget.onChanged(_currentValue);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'minusButton',
            onPressed: () {
              setState(() {
                _currentValue--;
              });
              widget.onChanged(_currentValue);
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'restarButton',
            onPressed: () {
              setState(() {
                _currentValue = 0;
              });
              widget.onChanged(_currentValue);
            },
            child: const Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}
