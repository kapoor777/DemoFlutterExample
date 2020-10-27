import 'package:flutter/material.dart';
import 'package:flutter1/model/PopupChoice.dart';
import 'model/DropDownListItem.dart';
/*
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "My App",
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: BtnExmp(),
  ));
}*/

class BtnExmp extends StatefulWidget {
  @override
  _BtnExmp createState() => _BtnExmp();
}

class _BtnExmp extends State<BtnExmp> {
  List<DropDownListItem> _dropdownItems = [
    DropDownListItem(1, "GeeksforGeeks"),
    DropDownListItem(2, "Javatpoint"),
    DropDownListItem(3, "tutorialandexample"),
    DropDownListItem(4, "guru99")
  ];

  List<DropdownMenuItem<DropDownListItem>> _dropdownMenuItems;
  DropDownListItem _itemSelected;
  double _speakervolume = 0.0;
  int _volume = 0;

  @override
  void initState() {
    super.initState();
    _itemSelected = _dropdownMenuItems[0].value;
    _selectedOption = choices[0];
  }

  void buildDropDownMenuItems() {
    _dropdownMenuItems = List();
    for (DropDownListItem listItem in _dropdownItems) {
      _dropdownMenuItems.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
  }

  List<PopupChoice> choices = [
    PopupChoice(name: 'Wi-Fi', icon: Icons.wifi),
    PopupChoice(name: 'Bluetooth', icon: Icons.bluetooth),
    PopupChoice(name: 'Battery', icon: Icons.battery_alert),
    PopupChoice(name: 'Storage', icon: Icons.storage),
  ];

  PopupChoice _selectedOption;

  @override
  Widget build(BuildContext context) {
    buildDropDownMenuItems();

    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () => {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () => {}),
          PopupMenuButton<PopupChoice>(onSelected: (choice) {
            setState(() {
              _selectedOption = choice;
            });
          }, itemBuilder: (BuildContext context) {
            return choices.skip(0).map(
              (PopupChoice choice) {
                return PopupMenuItem<PopupChoice>(
                  value: choice,
                  child: Text(choice.name),
                );
              },
            ).toList();
          })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.greenAccent, border: Border.all()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: _itemSelected,
                    items: _dropdownMenuItems,
                    elevation: 3,
                    style: TextStyle(color: Colors.deepPurple),
                    icon: Icon(Icons.arrow_downward),
                    onChanged: (value) {
                      setState(() {
                        _itemSelected = value;
                      });
                    }),
              ),
            ),
          ),
          Text(
            "We have selected ${_itemSelected.name}",
          ),
          IconButton(
              icon: Icon(Icons.volume_up),
              iconSize: 50,
              color: Colors.brown,
              tooltip: 'Increase volume by 5',
              onPressed: () {
                setState(() {
                  _speakervolume += 5;
                });
              }),
          Text('Speaker Volume: $_speakervolume'),
          InkWell(
            child: Icon(Icons.ring_volume, size: 50),
            splashColor: Colors.green,
            highlightColor: Colors.blue,
            onTap: () {
              setState(() {
                _volume += 5;
              });
            },
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text('$_volume', style: TextStyle(fontSize: 50)),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text('Status:- ${_selectedOption.name}',
                style: TextStyle(fontSize: 16)),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: OutlineButton(
              child: Text("Outline Button", style: TextStyle(fontSize: 20.0),),
              highlightedBorderColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: FlatButton(
              child: Text('Flat Button', style: TextStyle(fontSize: 20.0),),
              color: Colors.blueAccent,
              textColor: Colors.white,
              splashColor: Colors.green,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                    color: Colors.red,
                    width: 1,
                    style: BorderStyle.solid
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () => {print("ok")},
        splashColor: Colors.red,
      )
      /* floatingActionButton:FloatingActionButton.extended(
        onPressed: () {},
    icon: Icon(Icons.save),
    label: Text("Save"),
    )*/
      ,
    );
  }
}
