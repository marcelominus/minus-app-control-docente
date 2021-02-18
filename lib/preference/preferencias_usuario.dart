import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del Genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  // GET y SET del _colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  // GET y SET del nombreUsuario
  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }

  //======================================
  //
  //======================================
  get login {
    return _prefs.getBool('login') ?? false;
  }

  set login(bool value) {
    _prefs.setBool('login', value);
  }

  //----------------------------------------
  get nombre {
    return _prefs.getString('nombre') ?? 'null';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  //----------------------------------------
  get carnet {
    return _prefs.getString('carnet') ?? 'null';
  }

  set carnet(String value) {
    _prefs.setString('carnet', value);
  }

  //----------------------------------------
  get date {
    return _prefs.getString('date') ?? 'Obtener Fecha';
  }

  set date(String value) {
    _prefs.setString('date', value);
  }

  get datebool {
    return _prefs.getBool('datebool') ?? false;
  }

  set datebool(bool value) {
    _prefs.setBool('datebool', value);
  }

  //----------------------------------------
  get timerstart {
    return _prefs.getString('timerstart') ?? 'Obtener Hora de Inicio';
  }

  set timerstart(String value) {
    _prefs.setString('timerstart', value);
  }

  get timerstartbool {
    return _prefs.getBool('timerstartbool') ?? false;
  }

  set timerstartbool(bool value) {
    _prefs.setBool('timerstartbool', value);
  }

  //----------------------------------------
  get timerend {
    return _prefs.getString('timerend') ?? 'Obtener Hora de Final';
  }

  set timerend(String value) {
    _prefs.setString('timerend', value);
  }

  get timerendbool {
    return _prefs.getBool('timerendbool') ?? false;
  }

  set timerendbool(bool value) {
    _prefs.setBool('timerendbool', value);
  }
}
