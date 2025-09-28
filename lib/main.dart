import 'package:flutter/material.dart';
import 'package:proyecto/viewmodels/providers/medicine_provider.dart';
import 'package:proyecto/viewmodels/providers/user_provider.dart';
import 'package:proyecto/views/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/views/pages/setting_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context)=> MedicineProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingPage(),
    ),
    ); //Aquí tenemos la notificación del método ChangeNotifier de Provider
    //return MaterialApp(
      //debugShowCheckedModeBanner: false,
     // home: HomePage(),
    //);
  }
}










