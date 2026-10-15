import 'package:exploraec/controllers/gastos_controller.dart';
import 'package:exploraec/models/gasto.dart';
import 'package:exploraec/screens/gastos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Gasto _gasto(int id, String descripcion, String categoria) => Gasto.fromMap({
      'id': id,
      'descripcion': descripcion,
      'monto': 5.0,
      'categoria': categoria,
      'fecha': '2026-10-13',
    });

/// Pantalla mínima con el filtro y la lista: no necesita backend ni emulador.
class _ListaConFiltro extends StatefulWidget {
  const _ListaConFiltro(this.gastos);
  final List<Gasto> gastos;

  @override
  State<_ListaConFiltro> createState() => _ListaConFiltroEstado();
}

class _ListaConFiltroEstado extends State<_ListaConFiltro> {
  String? _categoria;

  @override
  Widget build(BuildContext context) {
    final visibles = filtrarPorCategoria(widget.gastos, _categoria);
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            FiltroCategoria(
              categorias: categoriasDe(widget.gastos),
              seleccionada: _categoria,
              alElegir: (c) => setState(() => _categoria = c),
            ),
            Expanded(
              child: ListView(
                children: [for (final g in visibles) ListTile(title: Text(g.descripcion))],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  final gastos = [
    _gasto(1, 'Almuerzo', 'comida'),
    _gasto(2, 'Taxi', 'transporte'),
    _gasto(3, 'Merienda', 'comida'),
    _gasto(4, 'Cine', 'entretenimiento'),
  ];

  test('filtrarPorCategoria devuelve solo la categoría pedida, o todos con null', () {
    expect(filtrarPorCategoria(gastos, 'comida').map((g) => g.descripcion), ['Almuerzo', 'Merienda']);
    expect(filtrarPorCategoria(gastos, null).length, 4);
    expect(categoriasDe(gastos), ['comida', 'transporte', 'entretenimiento']);
  });

  testWidgets('al elegir «comida» solo se ven los gastos de comida; «Todas» vuelve a mostrar todos', (tester) async {
    await tester.pumpWidget(_ListaConFiltro(gastos));
    expect(find.text('Taxi'), findsOneWidget);

    await tester.tap(find.widgetWithText(ChoiceChip, 'comida'));
    await tester.pump();
    expect(find.text('Almuerzo'), findsOneWidget);
    expect(find.text('Merienda'), findsOneWidget);
    expect(find.text('Taxi'), findsNothing);
    expect(find.text('Cine'), findsNothing);

    await tester.tap(find.widgetWithText(ChoiceChip, 'Todas'));
    await tester.pump();
    expect(find.text('Taxi'), findsOneWidget);
    expect(find.text('Cine'), findsOneWidget);
  });
}
