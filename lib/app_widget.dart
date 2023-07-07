import 'package:controle_pressao_arterial/app_routes.dart';
import 'package:controle_pressao_arterial/providers/config_provider.dart';
import 'package:controle_pressao_arterial/styles/tema_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ConfigProvider storeConfig;

  @override
  Widget build(BuildContext context) {
    storeConfig = Provider.of<ConfigProvider>(context);
    return MaterialApp(
      routes: AppRoutes.routes(),
      themeMode: storeConfig.tema,
      theme: MyThemest.claro,
      darkTheme: MyThemest.escuro,
    );
  }
}
