//Creacion de las tareas

import 'package:flutter/material.dart';
import 'package:lista_tareas/app/view/task_list/task_provider.dart';
import '../../model/task.dart';
import '../components/h1.dart';
import '../components/shape.dart';
import 'package:provider/provider.dart';

//Widget para tarea nueva
class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          TaskProvider()..fetchTasks(), //Encargado del listado de tareas
      child: const Scaffold(
        body: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //Boton cruz para agregar
          children: [
            _Header(),
            Expanded(child: _TaskList()),
          ],
        ),

        //Funcion para crear la tarea
      ),
    );
  }

  // Metodo que permite crear e imprimir la nueva tarea
}

class _NewTaskModal extends StatelessWidget {
  _NewTaskModal({required this.onTaskCreated});

  final _controler =
      TextEditingController(); // Controlador para el texto que ingrese el usuario
  final void Function(Task task) onTaskCreated;

  // Ventana emergente para la creacion de la tarea
  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 33,
        vertical: 23,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                21)), //Redondea los bordes superiores de la ventana
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: keyboardHeight),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize
              .min, // Adapta la altura de la ventana emergente segun el contenido
          children: [
            const H1('Nueva Tarea', fontFamily: 'Poppins'),
            const SizedBox(
              height: 26,
            ),
            TextField(
              //Casilla para la tarea nueva
              controller: _controler, //Controlador
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: '¿Qué vas hacer?',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(
                      0, 0, 0, 0.3), // RGB (Rojo, Verde, Azul) y opacidad
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            ElevatedButton(
              // Boton crear - para agregar la tarea nueva
              onPressed: () {
                if (_controler.text.isNotEmpty) {
                  final task = Task(_controler.text);
                  context
                      .read<TaskProvider>()
                      .addNewTask(task); //Se añade una nueva tarea
                  Navigator.of(context).pop(); //Cierra la ventana
                }
              },
              child: const Text('Crear'),
            )
          ],
        ),
      ),
    );
  }
}

//Widget para el listado de tareas
class _TaskList extends StatelessWidget {
  const _TaskList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Centra el título
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Alinear a los extremos
            children: [
              const H1('Pendientes', fontFamily: 'Poppins'),
              IconButton(
                icon: const Icon(Icons.add_comment_rounded,
                    size: 50), // Ícono para agregar tarea
                onPressed: () =>
                    _showNewTaskModal(context), // Acción para crear la tarea
              ),
            ],
          ),
          Container(
            height: 4, // Grosor de la línea
            color: Theme.of(context).colorScheme.primary, // Color de la línea
          ),
          Expanded(
            // Asegura que la lista ocupe todo el espacio disponible
            child: Consumer<TaskProvider>(builder: (_, provider, __) {
              if (provider.taskList.isEmpty) {
                return const Center(
                  child: Text('No hay tareas'),
                );
              }
              return ListView.separated(
                itemBuilder: (_, index) => TaskItem(
                  provider.taskList[index],
                  onTap: () =>
                      provider.onTaskDoneChange(provider.taskList[index]),
                  onDelete: () => provider.deleteTask(provider.taskList[index]),
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: provider.taskList.length,
              );
            }),
          ),
        ],
      ),
    );
  }

  // Método para mostrar la modal de nueva tarea
  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ChangeNotifierProvider.value(
        value: context.read<TaskProvider>(),
        child: _NewTaskModal(onTaskCreated: (Task task) {}),
      ),
    );
  }
}

// Widget del encabezado
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Row(children: [Shape()]),
          Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/tasks-list-image.png',
                width: 80,
              ),
              const SizedBox(height: 5),
              H1('Completa tus tareas',
                  color: Theme.of(context).colorScheme.surface,
                  fontFamily: 'Poppins'),
              const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}

// Widget para cada una de las tareas
class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {super.key, this.onTap, required this.onDelete});
  final Task task;
  final VoidCallback? onTap;
  final dynamic onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, //Cambia el estado de la tarea
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), //Redondea las esquinas de la tarjeta
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //
            children: [
              Row(
                children: [
                  Icon(
                    task.done
                        ? Icons.check_box_rounded // Icono tachado
                        : Icons.check_box_outline_blank, // Icono no tachado
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 10), // Espacio entre check y texto

                  // Texto que se ajusta y no desborda
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.5, // Limitar el ancho del texto
                    child: Text(
                      // Texto tachado cuando la tarea esté hecha
                      task.title,
                      style: TextStyle(
                        decoration: task.done
                            ? TextDecoration
                                .lineThrough // Tachado si está hecha
                            : TextDecoration
                                .none, // Sin tachado si no está hecha
                      ),
                      maxLines:
                          2, // Limita el texto a 2 lineas y si es mas largo muestra puntos suspensivos
                      overflow: TextOverflow
                          .ellipsis, // Se corta el texto si es demasiado largo
                    ),
                  ),
                ],
              ),
              // Botón para borrar la tarea
              IconButton(
                icon: const Icon(Icons.delete_forever_rounded),
                onPressed: () {
                  context
                      .read<TaskProvider>()
                      .deleteTask(task); //Elimina la tarea
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
