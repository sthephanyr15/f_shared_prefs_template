import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/local_preferences.dart';

class Authentication {
  final _sharedPreferences = LocalPreferences();

  //ejemplo para almacenar un string
  // await_sharedPreferences.storeData<String>('user', user);

  // aquí hay un ejemplo de cómo leer un bool
  Future<bool> get init async =>
      await _sharedPreferences.retrieveData<bool>('logged') ?? false;

  Future<bool> login(user, password) async {
    //String user = await SharedPreferences.getInstance('user', user);
    var user = await _sharedPreferences.retrieveData<String>('user');
    var password = await _sharedPreferences.retrieveData<String>('password');
    // verificar si user y password coinciden con los almacenados
    if (user == user && password == password) {
      // en ese caso cambiar el estado de loggeed y devolver  Future.value(true);
      await _sharedPreferences.storeData<bool>('logged', true);
      return Future.value(true);
    } else {
      return false;
    }
  }

  Future<void> signup(user, password) async {
    // almancenar user y password
    await _sharedPreferences.storeData<String>('user', user);
    await _sharedPreferences.storeData<String>('password', password);
  }

  void logout() async {
    // cambiar loggeed
    await _sharedPreferences.storeData<bool>('logged', false);
  }
}
