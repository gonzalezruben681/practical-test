import 'package:flutter/material.dart';
import 'package:test_flutter/presentation/screens/widgets/register_login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: size.height - 400, // 80 los dos sizebox y 100 el ícono
              width: double.infinity,
              child: const RegisterForm(),
            ),
          ],
        ),
      ),
    );
  }
}
