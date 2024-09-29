//Inicio por correo

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatePage extends StatelessWidget {
  const StatePage({super.key});

  //Botón enviar
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmailProvider(),
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _EmailTextField(),
              SizedBox(height: 20),
              _SendButton(),
              SizedBox(height: 20),
              _EmailText()
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailText extends StatelessWidget {
  const _EmailText();

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailProvider>(builder: (_, emailProvider, child) {   //"Consumer" permite escuchar los cambios del "_emailProvider" y reconstruirlo
      return Text('El correo introducido es: ${emailProvider.email}');
    });
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Enviar'),
    );
  }
}

 //Widget para el ingreso del correo
class _EmailTextField extends StatelessWidget {
  const _EmailTextField();
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => context.read<EmailProvider>().email = value,  //Se almacena el texto ingresado en la variable email
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: 'Correo electrónico',
      ),
    );
  }
}

//Gestión del estado para el ingreso del correo
class EmailProvider extends ChangeNotifier {
  String _email = '';   //La variable email hace de un estado efímero para poder tener acceso al correo

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }
}
