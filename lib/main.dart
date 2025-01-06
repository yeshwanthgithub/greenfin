import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_fin/core/utils/theme.dart';
import 'package:green_fin/presentation/screens/login_screen.dart';
import 'package:green_fin/presentation/screens/app.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final theme = appTheme();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'GreenFin',
      theme: theme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/app': (context) => const App(),
      },
    );
  }
}
