import 'package:flutter/material.dart';

import 'Palette.dart';
import 'model/ListData.dart';

/*void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "My App",
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: ScreenSecond(),
  ));
}*/

class ScreenSecond extends StatefulWidget {
  _ScreenSecondState createState() => _ScreenSecondState();
}

class _ScreenSecondState extends State<ScreenSecond> {
  List<ListData> dataList = List<ListData>();

  void getDataList() {
    dataList.add(
        ListData('CineArts at the Empire', '85 W Portal Ave', Icons.theaters));
    dataList
        .add(ListData('The Castro Theater', '429 Castro St', Icons.theaters));
    dataList.add(
        ListData('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters));
    dataList.add(ListData('Roxie Theater', '3117 16th St', Icons.theaters));

    dataList.add(ListData('United Artists Stonestown Twin',
        '501 Buckingham Way', Icons.theaters));
    dataList
        .add(ListData('AMC Metreon 16', '135 4th St #3000', Icons.theaters));
    dataList
        .add(ListData('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant));
    dataList.add(
        ListData('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant));
    dataList.add(ListData(
        'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant));
    dataList.add(ListData('La Ciccia', '291 30th St', Icons.restaurant));
    dataList.add(ListData('FSCD United Artists Stonestown Twin',
        '501 Buckingham Way', Icons.restaurant_menu));
    dataList
        .add(ListData('ZCX AMC Metreon 16', '135 4th St #3000', Icons.ac_unit_rounded));

    dataList.add(ListData(' RTR United Artists Stonestown Twin estrorent for faimly members',
        '501 Buckingham Way', Icons.theaters_outlined));
    dataList
        .add(ListData('ABC AMC Metreon 16', '135 4th St #3000', Icons.restaurant_menu_sharp));
  }

  ListTile _tile(String title, String subtitle, IconData icon, int index, BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
        onTap: () => onTapped(index),
    );
  }

  void onTapped(int index) {
    print("Title: "+dataList[index].title);
  }
 /* Scaffold.of(context).showSnackBar(new SnackBar(
  content: new Text("value")
  ));*/

  @override
  Widget build(BuildContext context) {
    dataList.clear();
    getDataList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dynamic Page",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: new ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _tile(dataList[index].title, dataList[index].subtitle,
                dataList[index].icon, index, context);
          }),
    );
  }
}
