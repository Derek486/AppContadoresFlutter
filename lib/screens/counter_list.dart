import 'package:flutter/material.dart';
import 'package:tarea09/screens/counter_detail.dart';

class CounterListScreen extends StatefulWidget {
  const CounterListScreen({super.key});

  @override
  State<CounterListScreen> createState() => _CounterListScreenState();
}

class _CounterListScreenState extends State<CounterListScreen> {
  List<int> counts = [0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contadores'),
      ),
      body: ListView.builder(
        itemCount: counts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CounterDetailScreen(
                  initialValue: counts[index],
                  onChanged: (value) {
                    setState(() {
                      counts[index] = value;
                    });
                  },
                ),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text('Contador ${index + 1}'),
                  subtitle: Text('Valor: ${counts[index]}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        counts.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counts.add(0);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
