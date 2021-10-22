import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Погода",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          iconTheme: IconThemeData(color: Colors.black54),
          // brightness: Brightness.light,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.settings), onPressed: () {})
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _headerImage() {
  return Image(
    image: NetworkImage(
        'https://sgp1.digitaloceanspaces.com/khabarhub/en/uploads/2020/03/sunny-weather.jpg'),
    fit: BoxFit.cover,
  );
}

Widget _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const <Widget>[
      Text(
        'Четверг - 21 октября',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus veniam, numquam labore aperiam vitae ratione magnam. Aspernatur nihil magni consequuntur ',
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: const <Widget>[
              Text(
                '15° Ясно',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          Row(
            children: const <Widget>[
              Text(
                'Архангельская область, Котлас',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°C',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.black),
      Icon(Icons.star, size: 15.0, color: Colors.black),
    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        "Инфо из openweathermap.org",
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black87,
        ),
      ),
      stars,
    ],
  );
}
