import 'package:flutter/material.dart';
import 'countdown.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Key Practice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  InkWell createRow(BuildContext context, String musicalKey, style) {
    return InkWell(
      child: Row(
        children: [
          Expanded(
            child: (Text(musicalKey,
                style: style, textAlign: TextAlign.center)),
          )
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Countdown(musicalKey: musicalKey)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final display1Style = Theme.of(context).textTheme.display1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createRow(context, 'C', display1Style),
            createRow(context, 'G', display1Style),
            createRow(context, 'D', display1Style),
//          Text(
//            '$_counter',
//            style: display1Style,
//          ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
