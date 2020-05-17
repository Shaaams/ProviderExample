import 'package:flutter/material.dart';
import 'package:new_app/Data/dummy_data.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                'data from api',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FutureBuilder(
              future: DummyData.getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Center(
                  child: snapshot.connectionState == ConnectionState.done
                      ? Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      : CircularProgressIndicator(),
                );
              },
            ),
            SizedBox(
              height: 277,
            ),
            Text(
              'Rate US',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 33,
            ),
            getFaces(0),
            Expanded(
              child: Container(),
            ),
            Text(
              'change the text size',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Slider(
              value: 22,
              onChanged: (newValue) {},
              max: 50,
              min: 20,
            ),
            Text(
              'rate them',
              style: TextStyle(color: Colors.white),
            ),
            Slider(
              value: 0,
              onChanged: (newValue) {},
              max: 4,
              min: 0,
            ),
            SizedBox(
              height: 44,
            ),
          ],
        ),
      ),
    );
  }

  getFaces(int index) {
    switch (index) {
      case 0:
        return Icon(
          Icons.sentiment_very_dissatisfied,
          size: 60,
          color: Colors.red,
        );
      case 1:
        return Icon(
          Icons.sentiment_dissatisfied,
          size: 60,
          color: Colors.redAccent,
        );
      case 2:
        return Icon(
          Icons.sentiment_neutral,
          size: 60,
          color: Colors.amber,
        );
      case 3:
        return Icon(
          Icons.sentiment_satisfied,
          size: 60,
          color: Colors.lightGreen,
        );
      case 4:
        return Icon(
          Icons.sentiment_very_satisfied,
          size: 60,
          color: Colors.green,
        );
    }
  }
}
