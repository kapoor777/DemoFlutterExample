import 'package:flutter/material.dart';
import 'package:flutter1/ButtonsExample.dart';
import 'package:flutter1/ScreenSecond.dart';
import 'package:flutter1/SingleChildScrollViewExp.dart';

import 'GridExample.dart';

/*void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "My App",
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: FlutterFormsExamp(),
  ));
}*/

class FlutterFormsExamp extends StatefulWidget {
  @override
  _FlutterFormsExamp createState() => _FlutterFormsExamp();
}

class _FlutterFormsExamp extends State<FlutterFormsExamp> {
  final _formKey = GlobalKey<FormState>();
  var _textController = new TextEditingController();
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Registgration Form"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(children: [
            GridExample(),
            ScreenSecond()
          ]),
        ));
  }


  /*

  body: Form(
        key: _formKey,
        child: ,
      ),

      
  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  FadeInImage.assetNetwork(
  placeholder: 'images/floppy.jpg',
  image: 'https://static.javatpoint.com/tutorial/flutter/images/flutter-creating-android-platform-specific-code3.png',
  height: 400,
  width: 250
  ),
  TextFormField(
  decoration: InputDecoration(
  icon: Icon(Icons.person),
  hintText: 'Enter your name',
  labelText: 'Name',
  ),
  validator: (value) {
  if (value.isEmpty) {
  return 'Please enter name';
  }
  return null;
  },
  ),
  TextFormField(
  decoration: InputDecoration(
  icon: Icon(Icons.phone),
  hintText: 'Enter a phone number',
  labelText: 'Phone',
  ),
  validator: (value) {
  if (value.isEmpty || value.trim().length <= 0) {
  return 'Please enter valid phone number';
  }
  return null;
  },
  onChanged: (value) {
  _formKey.currentState.validate();
  },
  ),
  TextFormField(
  decoration: const InputDecoration(
  icon: const Icon(Icons.calendar_today),
  hintText: 'Enter your date of birth',
  labelText: 'Dob',
  ),
  validator: (value) {
  if (value.isEmpty) {
  return 'Please enter valid date';
  }
  return null;
  },
  ),
  new Container(
  padding: EdgeInsets.only(top: 40.0),
  alignment: Alignment.center,
  child: Builder(
  builder: (context) => RaisedButton(
  child: const Text('Submit'),
  color: Colors.red,
  textColor: Colors.white,
  splashColor: Colors.redAccent,
  onPressed: () {
  if (_formKey.currentState.validate()) {
  _displayDialog(context);

  *//*Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Data is in processing.')));*//*
  }
  },
  ),
  ),
  ),
  ],
  )*/
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  _displayDialog(BuildContext context) {

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          title: Text("Demo alert dialog"),
          content: Container(
            width: MediaQuery.of(context).size.width - 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(
                    hintText: "Enter name",
                    labelText: "Name",
                  ),
                ),
                TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("SUBMIT"))
          ],
        );
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
