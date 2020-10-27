import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'model/Choice.dart';

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'Contact', icon: Icons.contacts),
  const Choice(title: 'Map', icon: Icons.map),
  const Choice(title: 'Phone', icon: Icons.phone)
];

class GridExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridExample();
  }
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

BestTutorSite _site = BestTutorSite.javatpoint;

class _GridExample extends State<GridExample> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valuefouth = false;
  String radioSelect = "";
  bool _loading = false;
  double _progressValue;
  bool switchvalue;
  var textValue = 'Switch is OFF';

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
    switchvalue = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(height: 225),
            child: new Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
                  fit: BoxFit.fitHeight,
                );
              },
              itemCount: 10,
              viewportFraction: .7,
              scale: .7,
            ),
          ),
          Switch(
            activeColor: Colors.redAccent,
            onChanged: (bool value) {
              setState(() {
                this.switchvalue = value;
                if(switchvalue)
                  textValue = 'Switch is ON';
                else
                  textValue = 'Switch is OFF';
              });
            },
            value: switchvalue,
            activeTrackColor: Colors.red,
            inactiveThumbColor: Colors.redAccent,
            inactiveTrackColor: Colors.grey,
          ),
          Text('$textValue', style: TextStyle(fontSize: 20),),
          CheckboxListTile(
            secondary: const Icon(Icons.alarm),
            title: const Text('Ringing at 4:30 AM every day'),
            subtitle: Text('Ringing after 12 hours'),
            value: this.valuethird,
            onChanged: (bool value) {
              print("VALUE : $value");
              setState(() {
                this.valuethird = value;
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            secondary: const Icon(Icons.alarm),
            title: const Text('Ringing at 5:00 AM every day'),
            subtitle: Text('Ringing after 12 hours'),
            value: this.valuefouth,
            onChanged: (bool value) {
              setState(() {
                this.valuefouth = value;
              });
            },
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _loading = !_loading;
                _progressValue = 0.0;
                _updateProgress();
              });
            },
            tooltip: 'Download',
            child: Icon(Icons.cloud_download),
          ),
          Container(
            child: _loading
                ? LinearProgressIndicator(
                    backgroundColor: Colors.redAccent,
                    value: _progressValue,
                  )
                : Text(
                    "Press to download",
                    style: TextStyle(fontSize: 14),
                  ),
          ),
          Container(
            child: CircularProgressIndicator(
              strokeWidth: 10,
              backgroundColor: Colors.yellow,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              value: _progressValue,
            ),
          ),
          Text('${(_progressValue * 100).round()}%'),
        ],
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0' ||
            _progressValue.toStringAsFixed(1) == '1') {
          _loading = false;
          t.cancel();
          return;
        }
      });
    });
  }
}
/*GridView.count(
crossAxisCount: 3,
children: List.generate(choices.length, (index) {
return Center(
child: SelectCard(choice: choices[index]),
);
}
)
)*/

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.orange,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(choice.icon, size: 50.0, color: textStyle.color),
                Text(choice.title, style: TextStyle(fontSize: 16)),
              ]),
        ));
  }
}
