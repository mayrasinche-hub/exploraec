import 'package:flutter/material.dart';
import '../models/place.dart';
import '../screens/detail_screen.dart';

/// Tarjeta reutilizable que representa un [Place] en cualquier lista de
/// la app (Inicio, resultados de categoría, etc.) — Sesión 2.
class PlaceCard extends StatelessWidget {
  final Place place;
  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        // Navegación al Detalle (Paso 6): Navigator.push agrega DetailScreen
        // encima de la pila, pasándole el Place de esta tarjeta.
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(place: place)),
        ),

        // Cuerpo de la tarjeta (Paso 5): ícono + nombre, categoría y
        // descripción. El nombre va dentro de Expanded para que nunca desborde.
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.place, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.nombre,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(place.categoria, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 4),
                    Text(
                      place.descripcion,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}