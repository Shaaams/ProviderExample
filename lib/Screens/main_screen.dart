import 'package:flutter/material.dart';
import 'package:new_app/Data/dummy_data.dart';
import 'package:provider/provider.dart';
import 'package:new_app/Provider/font_size.dart';
import 'package:new_app/Provider/rate.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    FontSizeNotify fontSizeNotify = Provider.of<FontSizeNotify>(context, listen: false);
    RateNotifiy rateNotify = Provider.of<RateNotifiy>(context, listen: false);
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
            Consumer<FontSizeNotify>(
              builder: (context, fontSizeConsum, widget){
                return      Text(
              'Rate US',
              style: TextStyle(
                fontSize: fontSizeConsum.fontSize,
                color: Colors.white,
              ),
            );
              }
            ),
            SizedBox(
              height: 33,
            ),
            Consumer<RateNotifiy>(
              builder:(context, rateConsum, widget){
                return getFaces(rateConsum.rate.toInt());
              } 
            
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              'change the text size',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          Consumer<FontSizeNotify>(
            builder: (context, fontSlideConsum, widget){
              return   Slider(
              value: fontSlideConsum.fontSize,
              onChanged: (newValue) {
                fontSlideConsum.changeFontSize(newValue);
              },
              max: 50,
              min: 20,
            );
            }
          ),
            Text(
              'rate them',
              style: TextStyle(color: Colors.white),
            ),
            Consumer<RateNotifiy>(
              builder: (context, rateSlideConsum, widget){
                return Slider(
              value: rateSlideConsum.rate,
              onChanged: (newValeu) {
                rateSlideConsum.changeRate(newValeu);
              },
              max: 4,
              min: 0,
            );
              }
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
