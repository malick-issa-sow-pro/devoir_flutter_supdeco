import 'dart:io';

import 'package:flutter/services.dart';

import '/app_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LegalAboutPage extends StatefulWidget {
  @override
  _LegalAboutPageState createState() => _LegalAboutPageState();
}

class _LegalAboutPageState extends State<LegalAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Paramètres',
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Légal et à propos',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text("Conditions d'utilisation"),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('politique de confidentialité'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('Licence'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('Politique du vendeur'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('Politique de retour'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
