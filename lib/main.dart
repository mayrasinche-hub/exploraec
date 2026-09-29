import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/map_placeholder_screen.dart';
import 'screens/favorites_placeholder_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ExploraEcApp());
}

class ExploraEcApp extends StatelessWidget {
  const ExploraEcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExploraEC',
      // Paso 1 — tema de marca de ExploraEC aplicado en toda la app.
      theme: AppTheme.theme,
      // TODO(sesion-03): OPCIONAL — descomenta las dos líneas de abajo (Paso 6 — modo oscuro). No borres nada.
      // Por qué: darkTheme le da a MaterialApp una segunda paleta, y
      // ThemeMode.system elige entre las dos según la preferencia del
      // dispositivo (Ajustes → Pantalla → Tema oscuro), sin código extra.
      // darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.system,
      home: const RootShell(),
    );
  }
}

/// Contenedor raíz con la barra de navegación inferior — Sesión 2.
class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _indiceActual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_indiceActual) {
        0 => const HomeScreen(),
        1 => const MapPlaceholderScreen(),
        _ => const FavoritesPlaceholderScreen(),
      },
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: (i) => setState(() => _indiceActual = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
      ),
    );
  }
}