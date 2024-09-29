//Configuro mis elementos de manera predefinida

import 'package:flutter/material.dart';
import 'package:lista_tareas/app/view/home/inherited_widgets.dart';
import 'package:lista_tareas/app/view/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Definir los colores que voy a utilizar
  @override
  Widget build(BuildContext context) {
    const primary = Color(0xff40B7AD);
    const textcolor = Color(0xff4A4A4A);
    const backgroundColor = Color(0xFFF5F5F5);
    return SpecialColor(
      color: Colors.redAccent,
      child: MaterialApp(
        //title: 'Flutter Demo',
        debugShowCheckedModeBanner:
            false, //Funcion para quitar la banda "Debug" en el emulador
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          scaffoldBackgroundColor: backgroundColor,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Poppins',
                bodyColor: textcolor,
                displayColor: textcolor,
              ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),

          //Definir estilo de botones de manera predefinida
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                54,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
