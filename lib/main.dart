import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OtherState(),
    );
  }
}

class OtherState extends StatefulWidget {
  @override
  _OtherStateState createState() => _OtherStateState();
}

class _OtherStateState extends State<OtherState> {
  bool switchvalue = false;
  bool switchListTileValue1 = false;
  double sliderTextValue = 0.0;
  double sliderValue4 = 0.0;
  void onChanged1(bool swithcedvalue) =>
      setState(() => switchvalue = swithcedvalue);
  void switchListTileValue(bool switchedListTileValue) =>
      setState(() => switchListTileValue1 = switchedListTileValue);
  void sliderTextValuefun(double sliderTextValue1) =>
      (() => sliderTextValue = sliderTextValue1);
  void sliderValuefunc(double slidervalue) =>
      setState(() => sliderValue4 = slidervalue);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("otherState"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Switch(value: switchvalue, onChanged: onChanged1),
              Checkbox(
                value: switchvalue,
                onChanged: onChanged1,
              ),
              Divider(),
              SwitchListTile(
                value: switchListTileValue1,
                onChanged: switchListTileValue,
                title: Text("Switch"),
              ),
              CheckboxListTile(
                value: switchListTileValue1,
                onChanged: switchListTileValue,
                title: Text("Checkbox"),
              ),
              Divider(),
              Text("changed State : ${(sliderTextValue * 100).round()}"),
              Slider(value: sliderTextValue, onChanged: sliderValuefunc),
              Divider(),
              Slider(
                value: sliderValue4,
                max: 100.0,
                min: 0.0,
                divisions: 10,
                label: '${sliderValue4.round()}',
                onChanged: (double value) {
                  setState(
                    () {
                      sliderValue4 = value;
                    },
                  );
                },
              ),
              RaisedButton(
                child: Text("Dialog"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text("Dialog Box"),
                      content: Text("Do you want to send?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context, 'canel');
                          },
                          
                        ),
                        FlatButton(
                          child: Text("Send"),
                          onPressed: () {
                            Navigator.pop(context, 'ok');
                          },
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
