import 'package:flutter/material.dart';

/*void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "My App",
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Stack1(),
  ));
}*/

class Stack1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scroll View",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 20; i++)
                Container(
                  margin: EdgeInsets.all(5),
                  child: buttonExp(i + 1),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonExp(int exampleNumber) => RaisedButton(
        onPressed: () {},
        child: Text("$exampleNumber"),
        color: Colors.blueAccent,
        textColor: Colors.white,
        splashColor: Colors.yellow,
      );
}
