import 'package:flutter/material.dart';
import 'package:authenty/screens/data_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:rich_alert/rich_alert.dart';

class DataScreen extends StatefulWidget {
  final String codEstudiante;
  DataScreen(this.codEstudiante);
  @override
  _DataScreenState createState() => _DataScreenState();
}

class AuthUser {
  String id;
  String nombre;
  String programa;
  String estado;
  String semestre;
  String notificacion;

  AuthUser(
      {this.id,
      this.nombre,
      this.programa,
      this.estado,
      this.semestre,
      this.notificacion});
  get getId => this.id;
  get getNombre => this.nombre;
  get getPrograma => this.programa;
  get getEstado => this.estado;
  get getSemestre => this.semestre;
  get getNotificacion => this.notificacion;

  set setId(int value) => this.id;
  set setNombre(String value) => this.nombre;
  set setPrograma(String value) => this.programa;
  set setEstado(String value) => this.estado;
  set setSemestre(int value) => this.semestre;
  set setNotificacion(String value) => this.notificacion;

  @override
  String toString() {
    return '{ ${this.id}, ${this.nombre}, ${this.programa}, ${this.estado}, ${this.semestre} }';
  }
}

class _DataScreenState extends State<DataScreen> {
  String codigoEstudiante = "No hay datos / No existe";
  String nombreCompletoEstudiante = "No hay datos / No existe";
  String programaEstudiante = "No hay datos / No existe";
  String estadoEstudiante = "No hay datos / No existe";
  String notificacionEstudiante = "No hay datos / No existe";

  Map data;
  AuthUser authUserObject;
  List usersData = [];

  getUsers() async {
    http.Response response = await http
        .get('http://virtualcues.com/sat/api/index.php?id=' + codigoEstudiante);

    data = jsonDecode(response.body);
    if (data == null) {
    } else {
      usersData = data["datos"];
    }

    if (data == null) {
      _showNoDataAlert(context);
    } else {
      AuthUser authUserObject = new AuthUser(
          id: usersData[0]["id"],
          nombre: usersData[0]["nombre"],
          programa: usersData[0]["programa"],
          semestre: usersData[0]["semestre"],
          estado: usersData[0]["estado"]);
      setState(() {
        codigoEstudiante = authUserObject.getId.toString();
        nombreCompletoEstudiante = authUserObject.getNombre.toString();
        programaEstudiante = authUserObject.getPrograma.toString();
        estadoEstudiante = authUserObject.getEstado.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistema de Autenticación Authenty"),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/media/logo.png",
                      width: 300.0,
                      height: 200.0,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Codigo del Estudiante:  ",
                              style: Theme.of(context).textTheme.headline2),
                          Text(codigoEstudiante,
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Nombre del Estudiante:  ",
                              style: Theme.of(context).textTheme.headline2),
                          Text(nombreCompletoEstudiante,
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Programa del Estudiante:  ",
                              style: Theme.of(context).textTheme.headline2),
                          Text(programaEstudiante,
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Estado:  ",
                              style: Theme.of(context).textTheme.headline2),
                          Text(estadoEstudiante,
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Notificación:  ",
                              style: Theme.of(context).textTheme.headline2),
                          Text(notificacionEstudiante,
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: MaterialButton(
                        elevation: 10.0,
                        minWidth: 170.0,
                        height: 50.0,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/consult');
                        },
                        child: Text(
                          "Realizar otra consulta",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    codigoEstudiante = widget.codEstudiante;
    getUsers();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}

_showNoDataAlert(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return RichAlertDialog(
          //uses the custom alert dialog
          alertTitle: richTitle("¡No se encontraron datos!"),

          alertSubtitle: richSubtitle(
            "¡Lo sentimos, ese codigo no se encuentra!",
          ),

          alertType: RichAlertType.WARNING,
          actions: <Widget>[
            FlatButton(
              color: Color(0XFF030047),
              textColor: Colors.white,
              child: Text("¡Vale!"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
