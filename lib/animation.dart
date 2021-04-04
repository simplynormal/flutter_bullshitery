import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  double _height = 200;
  double _width = 200;
  var _color = Colors.cyan;
  int count = 0;
  int demo = 69;

  void _updateState() {
    setState(
      () {
        _width = 400;
        _height = 400;
        _color = Colors.amber;
        demo = 900;
      },
    );
  }

  void _reverseState() {
    setState(() {
      _width = 200;
      _height = 200;
      _color = Colors.cyan;
      demo = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('Animation Demo'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (count % 2 == 0) {
                  _updateState();
                  print('State Updated!');
                } else {
                  _reverseState();
                  print('State Reversed!');
                }
                count++;
              },
              child: Text('Animate'),
            ),
            Center(
              child: AnimatedContainer(
                curve: Curves.bounceOut,
                duration: Duration(milliseconds: 900),
                width: _width,
                height: _height,
                color: _color,
                child: Center(
                  child: Text(
                    'Animation: $demo',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(milliseconds: 900),
                builder: (context, scale, child) {
                  return Transform.scale(scale: scale, child: child,);
                },
              child: Container(
                height: 200,
                width: 200,
                color: Colors.pink,
                child: Center(
                  child: Text(
                    'Tween Demo',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: Icon(
          Icons.home,
          color: Colors.white54,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class MyCurve extends Curve {
  final double count;

  MyCurve({this.count = 3});

  @override
  double transform(double t) {
    // TODO: implement transform
    var val = t * t;
    return val;
  }
}

class SineCurve extends Curve {
  final double count;
  final double omega = 2;

  SineCurve({this.count = 3});

  // t = x
  @override
  double transformInternal(double t) {
    var val = math.sin(count * omega * math.pi * t) * 0.5 + 0.5;
    return val; //f(x)
  }
}
