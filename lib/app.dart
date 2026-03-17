import 'package:flutter/material.dart';
import 'package:app/shared/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to App'),
        ),
      ),
      // TODO: Replace with GoRouter or auto_route configuration
      // routerConfig: appRouter,
    );
  }
}
