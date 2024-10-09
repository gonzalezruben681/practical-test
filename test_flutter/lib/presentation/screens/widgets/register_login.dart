import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_flutter/presentation/blocs/auth/auth_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late String email;
  late String password;
  bool isLoading = false;

  // Definir el FormGroup para el formulario
  final form = FormGroup({
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
    ]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReactiveTextField<String>(
                formControlName: 'email',
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      'El correo es obligatorio',
                  ValidationMessage.email: (error) =>
                      'El formato del correo no es válido',
                },
              ),
              const SizedBox(height: 16),
              ReactiveTextField<String>(
                formControlName: 'password',
                obscureText: true,
                onSubmitted: (_) => _register(),
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      'La contraseña es obligatoria',
                  ValidationMessage.minLength: (error) =>
                      'La contraseña debe tener al menos 8 caracteres',
                },
              ),
              const SizedBox(height: 16),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthError) {
                    isLoading = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  } else if (state is AuthSuccess) {
                    isLoading = false;
                  } else if (state is AuthLoading) {
                    isLoading = true;
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: isLoading ? null : _register,
                    child: Text(isLoading ? 'Espere...' : 'Registrarse'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    email = form.control('email').value ?? '';
    password = form.control('password').value ?? '';
    if (form.valid) {
      context.read<AuthBloc>().add(
            RegisterUserEvent(
              email: email,
              password: password,
            ),
          );
    } else {
      form.markAllAsTouched();
      return;
    }
  }
}
