import 'package:flutter/cupertino.dart';

//Utiliazmos el changeNotifier, para que al momento de guardar el nombre se actualice en todas las ventanas
class UserProvider extends ChangeNotifier{
  String userName;

  UserProvider({
    this.userName="Mapp",
  });

  void changeUserName({
    required String newUserName,
  }) async{
    userName=newUserName;
    notifyListeners();
  }
}