import 'package:shared_preferences/shared_preferences.dart';
@override

  dynamic showHome(key, val) async {
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      var _res = prefs.setBool(key, val);
      print('Set Bool Home : $val');
      return _res;
  }

  dynamic getShowHome(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.getBool(key);
    print('Get Bool Home : $_res');
    return _res;
}


Future<bool> removeHome(key) async{
   SharedPreferences preferences  =  await SharedPreferences.getInstance();
   return preferences.remove(key);
  }



Future reset(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
}