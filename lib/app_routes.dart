import 'package:controle_pressao_arterial/paginas/home/abas/registro_tab.dart';
import 'package:flutter/material.dart';

import 'paginas/home/home_page.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String detalhe = '/detalheItem';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (contex) => const HomePage(),
      detalhe: (contex) => const RegistroTab(),
    };
  }
}
