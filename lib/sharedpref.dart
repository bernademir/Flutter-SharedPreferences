import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesView extends StatefulWidget {
  @override
  _SharedPreferencesViewState createState() => _SharedPreferencesViewState();
}

class _SharedPreferencesViewState extends State<SharedPreferencesView> {
  SharedPreferences preferences;
  String data = "";

  @override
  void initState() {
    super.initState();
    getLocalData();
  }

  Future getLocalData() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.android_outlined,
              size: 100,
              color: Colors.green,
            ),
            Text(this.data),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  data = preferences.getString("key");
                });
              },
              child: Text("Save Shared Data"),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                preferences.setString("key", "berna");
              },
              child: Text("Get Shared Data"),
            ),
          ],
        ),
      ),
    );
  }
}
