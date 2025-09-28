import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  void _registerMedicine() {
    String medicineName = _medicineController.text;
    String time = _timeController.text;

    // Cuando lo conectemos con uns base de datos, nos comunicaremos con provder antes de venir aquí
    print('Medicamento registrado: $medicineName a las $time');

    // Muestra un mensaje de éxito
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Medicamento "$medicineName" registrado con éxito.'),
        duration: const Duration(seconds: 2),
      ),
    );

    // Método de tipo privado para linmpiar los campos una vez ussados
    _medicineController.clear();
    _timeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800], // Fondo azul como HomePage
      appBar: AppBar(
        title: const Text('Registrar Medicamento', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Color del ícono de la flecha de regreso
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Detalles del Medicamento',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),

                        // Campo: Nombre del medicamento
                        TextField(
                          controller: _medicineController,
                          decoration: InputDecoration(
                            labelText: 'Nombre del Medicamento',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.medical_services_outlined),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Campo: Horario de toma - investigar lo modos para registro de dia y hora local
                        TextField(
                          controller: _timeController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelText: 'Horario (ej. 9:00 AM)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.schedule),
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Botón para registrar medicamento
                        ElevatedButton.icon(
                          onPressed: _registerMedicine,
                          icon: const Icon(Icons.add_task),
                          label: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Registrar',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800], // Color de fondo del botón
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}