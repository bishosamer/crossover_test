import 'package:crossover_test/main_page.dart';
import 'package:crossover_test/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tik Tok Clone',
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(0.5)),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff01202b),
              primary: const Color(0xff01202b)),
          useMaterial3: true,
          iconTheme: const IconThemeData(color: Colors.white, size: 33),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white, fontSize: 30),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
            bodySmall: TextStyle(color: Colors.white),
          ),
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => HomeScreenBloc()),
          ],
          child: const MainPage(),
        ));
  }
}
