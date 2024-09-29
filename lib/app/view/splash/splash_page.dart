// Pantalla de bienvenida
import 'package:flutter/material.dart';
import 'package:lista_tareas/app/view/components/h1.dart';
import 'package:lista_tareas/app/view/components/shape.dart';
import 'package:lista_tareas/app/view/task_list/task_list_page.dart';
import 'package:lista_tareas/app/view/frases.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos una frase aleatoria cada vez que se carga la pantalla
    final fraseAleatoria = Frases.getFraseAleatoria();

    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Shape(),
            ],
          ),

          // Título
          const SizedBox(height: 20),
          H1('Lista de Tareas',
              color: Theme.of(context).colorScheme.primary,
              fontFamily:
                  'Poppins'), // H1 es la función para el título principal
          const SizedBox(height: 80),

          // Imágen
          Image.asset(
            'assets/onboarding-image.png',
            //width: 280,
            height: 268,
          ),

          // Mostrar frase aleatoria
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              fraseAleatoria, // Aquí se muestra la frase aleatoria
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 109, 212),
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.justify,
            ),
          ),

          const SizedBox(height: 70),
          // Botón centrado con el texto "Inicia Aquí"

          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const TaskListPage();
                }));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 16), // Ajusta el espaciado
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                minimumSize: Size.zero, // Elimina el tamaño mínimo
                fixedSize: null, // Deja que el tamaño se ajuste al contenido
              ),
              child: const Text(
                'Perrea Aquí',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Colors.white, // Color del texto del botón
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
