import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double top = 100;
  double bottom = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          homeWidget(),
          CardWidget(),
        ],
      ),
    );
  }
}

Widget card(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(5),
    color: Colors.blue,
    width: MediaQuery.of(context).size.width - 10,
  );
}

class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  double top = 100;
  double bottom = 100;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Positioned(
          top: top,
          bottom: bottom,
          child: Center(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  if (top + details.delta.dy >= 100 &&
                      top + details.delta.dy <=
                          MediaQuery.of(context).size.width + 200) {
                    top += details.delta.dy;
                    bottom -= details.delta.dy;
                  }
                });
              },
              child: Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      child: card(context),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget homeWidget() {
  return Scaffold(
    appBar: AppBar(
      title: Text("Testing Gestures"),
      backgroundColor: Colors.green,
    ),
    body: Center(
      child: RaisedButton(
        onPressed: () {},
        child: Text("I'm a button"),
      ),
    ),
  );
}
