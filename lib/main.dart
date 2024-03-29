import 'package:budget_tracker_app/screens/home.dart';
import 'package:budget_tracker_app/services/budget_service.dart';
import 'package:budget_tracker_app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeService>(create: (_) => ThemeService()),
        ChangeNotifierProvider<BudgetService>(create: (_) => BudgetService()),
      ],
      child: Builder(builder: (context) {
        final themeService = Provider.of<ThemeService>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                brightness:
                    themeService.darkTheme ? Brightness.dark : Brightness.light,
                seedColor: Colors.indigo),
          ),
          home: Home(),
        );
      }),
    );
  }
}