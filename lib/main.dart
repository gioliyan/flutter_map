import 'package:flutter/material.dart';
import 'package:tugas4_map/riwayatkonversi.dart';
import 'inputuser.dart';
import 'output.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

double _inputuser = 0;
String _newValue = "Kelvin";
double _result = 0;
List<String> listViewItem = List<String>();
TextEditingController etinputuser = new TextEditingController();

void perhitungansuhu() {
  _inputuser = double.parse(etinputuser.text);
  if (_newValue == "Kelvin") {
    _result = _inputuser + 273;
    listViewItem.add("$_newValue : $_result");
  } else {
    _result = (4 / 5) * _inputuser;
    listViewItem.add("$_newValue : $_result");
  }
}

class _MyAppState extends State<MyApp> {
  var listItem = ["Kelvin", "Reamur"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              inputuser(etinputuser: etinputuser),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                    perhitungansuhu();
                  });
                },
              ),
              output(result: _result),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      perhitungansuhu();
                    });
                  },
                  color: Colors.blue,
                  hoverColor: Colors.blue[900],
                  textColor: Colors.white,
                  child: Text("Konversi Suhu"),
                ),
              ),
              Container(
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              riwayatkonversi(listViewItem: listViewItem),
            ],
          ),
        ),
      ),
    );
  }
}
