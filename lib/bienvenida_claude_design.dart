import 'package:flutter/material.dart';

class BienvenidaScreenClaudeDesign extends StatelessWidget {
  const BienvenidaScreenClaudeDesign({super.key});

  // Colores tomados del diseño generado por Claude
  static const Color verdeSelva = Color(0xFF0F2A22);
  static const Color verdeProfundo = Color(0xFF0A1F19);
  static const Color naranja = Color(0xFFE8892A);
  static const Color crema = Color(0xFFF3EFE6);
  static const Color verdeTexto = Color(0xFF8FC2A8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [verdeSelva, verdeProfundo],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(flex: 2),
                const Icon(Icons.location_on, size: 72, color: naranja),
                const SizedBox(height: 24),
                const Text(
                  'ExploraEC',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: crema,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Descubre lugares cerca de ti,\nlistos para explorar hoy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: verdeTexto, height: 1.4),
                ),
                const Spacer(flex: 3),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: naranja,
                      foregroundColor: const Color(0xFF1A1A1A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Empezar',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Encuentra tu próximo destino en segundos',
                  style: TextStyle(fontSize: 13, color: verdeTexto),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}