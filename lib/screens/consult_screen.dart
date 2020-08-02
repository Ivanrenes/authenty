import 'package:flutter/material.dart';
import 'package:authenty/screens/data_screen.dart';
import 'package:rich_alert/rich_alert.dart';

class ConsultScreen extends StatefulWidget {
  @override
  _ConsultScreenState createState() => _ConsultScreenState();
}

class _ConsultScreenState extends State<ConsultScreen> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                      width: 150.0,
                      height: 150.0,
                    ),
                    Text("¡Atención!",
                        style: Theme.of(context).textTheme.headline1),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Aquí podrá realizar la busqueda del estudiante CUES",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            Text("Digite el codigo del estudiante:"),
                          ],
                        ),
                      ),
                      TextField(
                          decoration: InputDecoration(
                              labelText: "Codigo del Estudiante"),
                          controller: _controller,
                          keyboardType: TextInputType.number),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MaterialButton(
                        elevation: 10.0,
                        minWidth: 170.0,
                        height: 50.0,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        onPressed: () {
                          if (_controller.text != '') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DataScreen(_controller.text)));
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return RichAlertDialog(
                                    //uses the custom alert dialog
                                    alertTitle: richTitle("¡Atención!"),

                                    alertSubtitle: richSubtitle(
                                      "¡No puedes dejar el codigo en blanco!",
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
                        },
                        child: Text(
                          "Consultar",
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
}
