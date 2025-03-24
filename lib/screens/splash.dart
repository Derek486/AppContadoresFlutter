import 'package:flutter/material.dart';
import 'package:counter_application/screens/counter_list.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Vector.png',
                  width: 141,
                  height: 129,
                ),
              ],
            ),
            const SizedBox(height: 29),
            Image.asset(
              'assets/images/onboarding-image.png',
              width: 180,
              height: 168,
            ),
            const SizedBox(height: 99),
            Text(
              "Lista de contadores",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 21),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Ingresa y maneja un conjunto de contadores según sus preferencias y usos',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const CounterListScreen();
                }));
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
