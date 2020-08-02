import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/media/logo.png",
                        width: 350.0,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sistema de Información",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Text(
                        "Authenty",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  MaterialButton(
                    elevation: 10.0,
                    minWidth: 170.0,
                    height: 50.0,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/consult");
                    },
                    child: Text(
                      "Ingresar",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
