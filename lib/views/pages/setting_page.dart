import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/providers/user_provider.dart';
import 'home_page.dart'; // Asegúrate de que esta ruta sea correcta

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>{
  late TextEditingController userNameController;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador
    userNameController = TextEditingController();
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    // Obtener el nombre actual para mostrarlo como valor inicial si no es el primer build
    final currentUserName = context.watch<UserProvider>().userName;

    // Opcional: Si el controlador está vacío, le asignamos el nombre actual del Provider
    if (userNameController.text.isEmpty) {
      userNameController.text = currentUserName;
    }

    return Scaffold(
      backgroundColor: Colors.blue[800], // Fondo Azul Oscuro
      appBar: AppBar(
        title: const Text(
          'Configuración de Usuario',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0, // Quitamos la sombra para un look más limpio
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Pequeño espacio para que el contenido blanco no inicie pegado al AppBar
            const SizedBox(height: 30),
            Expanded(
              child: ClipRRect(
                // Bordes redondeados grandes para que coincidan con el diseño de HomePage
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Colors.white, // Contenedor principal de contenido blanco
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Actualizar Nombre',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 40.0),

                        // Etiqueta del campo de texto
                        const Text(
                          'Nuevo Nombre de Usuario:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),
                        ),
                        const SizedBox(height: 8.0),

                        // Campo de Texto (TextField)
                        TextField(
                          controller: userNameController,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            hintText: 'Ej. Paolis Saludable',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.blue[50], // Un azul muy claro como fondo del input
                            prefixIcon: Icon(Icons.person, color: Colors.blue[600]),
                            contentPadding: const EdgeInsets.symmetric(vertical: 18),
                          ),
                        ),

                        const SizedBox(height: 40.0),

                        // Botón de Guardar (ElevatedButton)
                        ElevatedButton(
                          onPressed: () {
                            // 1. Guardar el nuevo nombre en el Provider
                            context.read<UserProvider>().changeUserName(newUserName: userNameController.text.trim());

                            // Ocultar el teclado y limpiar el campo (opcional, si quieres que quede vacío)
                            FocusManager.instance.primaryFocus?.unfocus();
                            // userNameController.clear(); // Lo dejo comentado para que el usuario vea el nombre guardado

                            // 2. Navegar de vuelta a HomePage (reemplazando la página actual)
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600], // Azul del mismo tono que el contenedor de notificación de HomePage
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            elevation: 8,
                          ),
                          child: const Text(
                            'Guardar y Volver a Home',
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )
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