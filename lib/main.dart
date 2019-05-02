import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Stateful Widget Example',
    home: FirstName(),
  ));
}

class FirstName extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstName();
  }
}

class _FirstName extends State<FirstName> {
  String firstName = "";
  var genders = ['Male','Female','Other'];
String _currentlySelectedItem = "Male";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget Example'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[

              TextField(
                onChanged: (String value){
                  setState(() {
                    firstName = value;
                  });
                },

                onSubmitted: (String value) {
                 setState(() {
                   firstName = value;
                 });
                },
              ),

              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Your first name is $firstName'),
              ),

              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Select Your Gender'),
              )
              ,

              DropdownButton<String> (
                items: genders.map((String dropdownStringItem){
                      return DropdownMenuItem<String>(

                        value: dropdownStringItem,
                        child: Text(dropdownStringItem),
                      );
                }).toList(),
                onChanged: (String valueSelected){
                  setState(() {
                    _currentlySelectedItem = valueSelected;
                  });
                },
                value: _currentlySelectedItem,
              )

            ],
          ),
        ));
  }
}
