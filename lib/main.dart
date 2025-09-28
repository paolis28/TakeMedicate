import 'package:flutter/material.dart';
import 'package:proyecto/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/presentation/pages/setting_page.dart';
import 'package:proyecto/presentation/providers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
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










