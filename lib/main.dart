import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to flutter',
      home: Scaffold(
        backgroundColor: Color(0xFF7889CF),
        appBar: AppBar(
          title: Text("Counter"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text(
                'Tap "-" to decrement',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              CounterWidget(),
              Text(
                'Tap "+" to increment',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFC5CBEA),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            tooltip: 'Decrement',
            icon: Icon(Icons.horizontal_rule),
            onPressed: () {
              setState(() {
                _count--;
              });
            },
          ),
          Text(
            "$_count",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          IconButton(
            tooltip: 'Increment',
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _count++;
              });
            },
          ),
        ],
      ),
    );
  }
}
