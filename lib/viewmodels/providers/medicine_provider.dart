import 'package:flutter/cupertino.dart';
import 'package:proyecto/models/Medicine.dart'; // Asegúrate de que esta ruta sea correcta

class MedicineProvider extends ChangeNotifier{
  // Variable privada para almacenar el medicamento registrado.
  Medicine? _currentMedicine;

  // Getter para exponer el medicamento actual (solo lectura).
  Medicine? get currentMedicine => _currentMedicine;

  // 3. Método para guardar un nuevo medicamento y notificar a los oyentes.
  void saveMedicine({
    required String nombre,
    required String horario,
  }) {

    _currentMedicine = Medicine(nombre: nombre, horario: horario);
    notifyListeners();
  }
}