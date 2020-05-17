import 'package:flutter/material.dart';
import 'package:new_app/Provider/counter.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              bloc.txt,
            ),
            Text(
              bloc.cnt.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              onPressed:(){
                bloc.deCnt();
              },
              child: Icon(Icons.remove),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          bloc.intCnt();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}