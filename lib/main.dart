import 'package:flutter/material.dart';
import 'bienvenida_claude_design.dart';

void main() {
  runApp(const ExploraEcApp());
}

class ExploraEcApp extends StatelessWidget {
  const ExploraEcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExploraEC',
      home: const BienvenidaScreenClaudeDesign(),
    );
  }
}

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key});

  // Colores tomados del diseño de Stitch
  static const Color verde = Color(0xFF006B4F);
  static const Color verdeClaro = Color(0xFF1FA37A);
  static const Color fondo = Color(0xFFF7F9FC);
  static const Color texto = Color(0xFF1B1F24);
  static const Color gris = Color(0xFF5F6B76);

  Widget _etiqueta(IconData icono, String nombre) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE1E6EB)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 16, color: verde),
          const SizedBox(width: 4),
          Text(nombre, style: const TextStyle(fontSize: 13, color: texto)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4EF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'ECUADOR Y EL MUNDO',
                  style: TextStyle(fontSize: 11, color: verde, fontWeight: FontWeight.w600),
                ),
              ),
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(Icons.explore, size: 64, color: verdeClaro),
              ),
              const SizedBox(height: 24),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Explora', style: TextStyle(color: texto)),
                    TextSpan(text: 'EC', style: TextStyle(color: verde)),
                  ],
                ),
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Descubre lugares únicos, rincones ocultos y experiencias auténticas cerca de ti a cada paso.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: gris, height: 1.4),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _etiqueta(Icons.restaurant, 'Gastronomía'),
                  _etiqueta(Icons.landscape, 'Naturaleza'),
                  _etiqueta(Icons.museum, 'Cultura'),
                  _etiqueta(Icons.photo_camera, 'Miradores'),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verde,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Empezar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}