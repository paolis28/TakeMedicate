import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/presentation/providers/user_provider.dart';
import 'register_page.dart';

//Manejamos un estado de tipo StateFulWidget porque es una pagina que solo se necesita construir una vez
class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex=0;

  List<Widget> widgetList=const[
    RegisterPage()
  ];

  //Aquí creamos la instancia para la pagina de HomePage
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //Para los colores existe una tabla que indica a que número hace referencia ese color
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //Manejo de la navegación entre páginas
        onTap: (index){
          setState((){
            myIndex=index;
          });

          if(myIndex==1){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
          }

          if(myIndex==2){
            Navigator.pop(context);
          }
        },
        currentIndex: myIndex ,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.amber),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Register', backgroundColor: Colors.indigo),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Salida')
      ],

      ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  //Utilizamos MainAxis para alinear el contenedor y que los compnenetes dentro de hijo
                  //no lleguen a encimarse
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //De momento estará un nombre estatico pero pasaremos el usuario después
                    //Así como en una estructura tipo Text podemos modificarlo con estilo y demás
                    //De acuerdo a como lo queramos
                    Column(
                        children:[
                          FadeInDown(
                            delay:Duration(milliseconds: 1000),
                            child: Text(
                              //Aqui implementamos nuestro primero provider para pasar el nombre del usuario
                              context.watch<UserProvider>().userName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          FadeInDown(
                            delay:Duration(milliseconds: 1000),
                            child: Text(
                              '26/09/2025',
                              style: TextStyle(color: Colors.blue[200]),
                            ),
                          ),
                        ]
                    ),
                    //notificación
                    ElasticIn(
                      delay:Duration(milliseconds: 1000),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          )
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 25,
          ),

          //search Bar
          FadeInDown(
            delay:Duration(milliseconds: 1000),
            child: Container(
              decoration: BoxDecoration(color: Colors.blue[600], borderRadius: BorderRadius.circular(12)),
              //BoxDecoration se usa para describir como se debe implementar una caja
                padding: EdgeInsets.all(12),
              child:Row(
                children: [
                  Icon(Icons.search, color: Colors.white,),
                  SizedBox(width: 5,),
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                // Ya no se necesita 'height: 500' gracias a Expanded.
                color: Colors.white,
                child: Padding( // Retira el Center y usa solo Padding
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                  child: SingleChildScrollView(
                    // Añade crossAxisAlignment: CrossAxisAlignment.stretch para que el Column
                    // fuerce a sus hijos a ocupar el ancho horizontal disponible (como la Card).
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // La tarjeta ahora ocupará el ancho del Padding
                        CustomCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],),
      ),
    );
  }
}

// Nueva tarjeta con imagen de fondo y efecto de despliegue
class CustomCard extends StatefulWidget {
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Imagen de fondo
          Ink.image(
            image: NetworkImage('https://images.unsplash.com/photo-1576086213794-68bc93a8d179?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODQxNjZ8MHwxfHNlYXJjaHwxNXx8bWVkaWNpbmV8ZW58MHx8fHwxNjQzODk4MTI1&ixlib=rb-1.2.1&q=80&w=1080'),
            height: 200,
            fit: BoxFit.cover,
          ),
          // Capa de oscurecimiento para que se lea mejor el texto
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Contenido principal
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Flecha que despliega el contenido
                IconButton(
                  icon: Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _expanded ? 80 : 0,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      "Lunes - 9:00 A.M y Miercoles - 5:00 P.M",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

















