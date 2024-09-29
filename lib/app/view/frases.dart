import 'dart:math';

class Frases {
  static final List<String> frases = [
    "¡Haz tus tareas como si fueran un juego de Tetris: encaja todo en su lugar!",
    "Tus tareas son como pizzas: mejor hacerlas en porciones pequeñas.",
    "Completa tus tareas y sé productivo, o al menos finge muy bien.",
    "Tus tareas no se harán solas, a menos que tengas un gemelo secreto.",
    "Haz tus tareas como un ninja: rápido, silencioso y con ropa negra.",
    "Tus tareas son como calcetines: mejor hacerlas por pares.",
    "Completa tus tareas y gana puntos de experiencia en la vida real.",
    "Tus tareas son como dragones: enfréntalas con valentía (y tal vez un extintor).",
    "Haz tus tareas como si fueran un baile: con ritmo y movimientos exagerados.",
    "Tus tareas son como chocolate: mejor no dejarlas derretirse.",
    "Completa tus tareas y siente el poder de un superhéroe del orden.",
    "Tus tareas son como chistes: mejor terminarlas con una sonrisa.",
    "Haz tus tareas como si fueras un espía: con sigilo y mucho café.",
    "Tus tareas son como un rompecabezas: resuelve una pieza a la vez.",
    "Completa tus tareas y gana el derecho a ser un vago profesional después.",
    "Tus tareas son como unicornios: raras de ver, pero mágicas cuando aparecen.",
    "Haz tus tareas como si fueran un videojuego: supera cada nivel con estilo.",
    "Tus tareas son como memes: mejor hacerlas virales (en tu vida).",
    "Completa tus tareas y siente la satisfacción de un Jedi del orden.",
    "Tus tareas son como palomitas de maíz: mejor hacerlas saltando de una en una.",
    "Haz tus tareas como si fueras un chef: con precisión y un toque de locura.",
    "Tus tareas son como selfies: hazlas bien a la primera o repítelas mil veces.",
    "Completa tus tareas y gana el título de 'Domador de Procrastinación'.",
    "Tus tareas son como un sándwich: mejor con varias capas de esfuerzo.",
    "Haz tus tareas como si fueras un mago: con trucos y mucho 'abracadabra'.",
    "Tus tareas son como un maratón de series: mejor hacerlas en sesiones intensas.",
    "Completa tus tareas y desbloquea el nivel secreto de 'Adulto Funcional'.",
    "Tus tareas son como un pastel: se ven mejor cuando están bien terminadas.",
    "Haz tus tareas como si fueras un detective: resuelve el misterio del desorden.",
    "Tus tareas son como un castillo de naipes: construye con cuidado y paciencia.",
    "Completa tus tareas y gana el premio al 'Multitarea Maestro'.",
    "Tus tareas son como un partido de fútbol: mejor terminarlas antes del silbatazo final.",
    "Haz tus tareas como si fueran un juego de Jenga: con precisión y sin que se caiga todo.",
    "Tus tareas son como un concierto de rock: dalo todo hasta el final.",
    "Completa tus tareas y conviértete en el 'Señor del Orden' (anillo no incluido).",
    "Tus tareas son como un cubo de Rubik: confusas al principio, satisfactorias al final.",
    "Haz tus tareas como si fueras un pirata: busca el tesoro escondido bajo el desorden.",
    "Tus tareas son como un juego de Pac-Man: devora todas antes de que te alcancen.",
    "Completa tus tareas y gana el derecho a usar una capa de superhéroe en casa.",
    "Tus tareas son como un control remoto: mejor no perderlas entre los cojines del sofá.",
    "Haz tus tareas como si fueras un explorador: descubre nuevas formas de ser productivo.",
    "Tus tareas son como un tornado: mejor controlarlas antes de que lo destruyan todo.",
    "Completa tus tareas y desbloquea el logro 'Maestro del Tiempo y el Espacio'.",
    "Tus tareas son como un juego de Monopoly: gana propiedades de productividad.",
    "Haz tus tareas como si fueras un DJ: mezcla trabajo y diversión en perfecta armonía.",
    "Tus tareas son como un bufé: prueba un poco de todo, pero no te empaches.",
    "Completa tus tareas y gana el derecho a usar un cinturón de herramientas imaginario.",
    "Tus tareas son como un rompecabezas 3D: confusas, pero impresionantes cuando están completas.",
    "Haz tus tareas como si fueras un domador de leones: con cautela y mucho valor.",
    "Tus tareas son como una montaña rusa: aterradoras al principio, emocionantes al final.",
    "Cada tarea diaria te acerca a tus objetivos. ¡Adelante!",
    "La constancia y el esfuerzo constante te llevan al éxito.",
    "Concentra tu energía en cumplir tus tareas con entusiasmo.",
    "Cada paso te acerca a la meta, no te rindas.",
    "Hoy es el día perfecto para lograr algo increíble.",
    "Enfócate en lo que puedes hacer, no en lo que no puedes.",
    "Tus tareas son oportunidades de crecimiento. Ábralas con alegría.",
    "No importa lo pequeña que sea la tarea, siempre vale la pena hacerla bien.",
    "Cada tarea completada te da fuerza para continuar.",
    "Usa el poder de la pequeña acción diaria para transformar tu vida.",
    "Cada tarea es una nueva oportunidad para demostrar tu determinación.",
    "Cuando empiezas a cumplir tus tareas, el éxito se acelera.",
    "Concentra tu energía en lo que puedes controlar: tus tareas diarias.",
    "La mejor manera de predecir el futuro es creándolo a través de tus tareas.",
    "Tus tareas diarias son los ladrillos que construyen tus sueños.",
    "Cada tarea completada es un logro que debes celebrar.",
    "Enfócate en una tarea a la vez y verás cómo avanzas.",
    "No esperes a sentirte motivado, simplemente comienza con tus tareas.",
    "Tus tareas diarias te convierten en la mejor versión de ti mismo.",
    "Cada tarea realizada te acerca a un paso de tu verdadero propósito.",
    "La disciplina en las pequeñas tareas te lleva a logros grandes.",
    "No dejes que las distracciones se interpongan en tus tareas diarias.",
    "Cada tarea completada te da más confianza para seguir adelante.",
    "La diferencia entre soñar y lograr está en hacer tus tareas.",
    "Enfócate en dar lo mejor de ti en cada tarea que realizas.",
    "Tus tareas diarias son los pilares que sostienen tus sueños.",
    "Cada tarea terminada es un triunfo que te impulsa a seguir.",
    "No importa lo pequeña que sea, cada tarea cuenta en tu camino al éxito.",
    "Deja que la determinación sea tu guía en el cumplimiento de tus tareas.",
    "Tus tareas diarias son los ladrillos que construyen tu legado.",
    "Cada tarea completada te acerca a tu mejor versión.",
    "No te distraigas, mantente enfocado en tus tareas.",
    "Tus tareas diarias son el puente entre donde estás y dónde quieres llegar.",
    "La constancia en las tareas diarias es la clave del progreso.",
    "Cada tarea finalizada es una victoria que te inspira a seguir.",
    "No importa lo abrumadoras que parezcan tus tareas, puedes hacerlo.",
    "Tus tareas diarias son el combustible que alimenta tus sueños.",
    "Enfócate en lo que puedes hacer hoy, no en lo que no pudiste ayer.",
    "Cada tarea completada es un paso más cerca de tus objetivos.",
    "No dejes que la pereza se interponga en el cumplimiento de tus tareas.",
    "Tus tareas diarias son los cimientos de tu éxito futuro.",
    "La disciplina en lo pequeño te lleva a lo grande.",
    "Cada tarea finalizada te da la energía para seguir adelante.",
    "No permitas que las excusas te impidan hacer tus tareas.",
    "Tus tareas diarias son la llave que abre puertas hacia tus sueños.",
    "La constancia en las pequeñas tareas es la clave del progreso.",
    "Cada tarea completada te acerca a una vida más plena y satisfactoria.",
    "No te rindas, sigue enfocado en tus tareas y lograrás grandes cosas.",
    "Tus tareas diarias son los ladrillos que construyen tu futuro.",
    "Cada tarea finalizada te acerca más a tu mejor versión.",
  ];

  // Método para obtener una frase aleatoria
  static String getFraseAleatoria() {
    final random = Random();
    return frases[random.nextInt(frases.length)];
  }
}