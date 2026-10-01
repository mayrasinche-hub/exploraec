import 'package:flutter_test/flutter_test.dart';
import 'package:exploraec/models/place.dart';

void main() {
  test('Existen lugares de ejemplo', () {
    expect(lugaresEjemplo.isNotEmpty, true);
  });
}