import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/qrcode.dart';
import 'body.dart';
import 'login.dart';
import 'animation.dart';
import 'test.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/test',
        routes: {
          '/': (context) => Container(color: Colors.grey[400], child: SafeArea(child: Home())),
          '/login': (context) => Container(color: Colors.grey[400], child: SafeArea(child: LoginScreen())),
          '/qr': (context) => Container(color: Colors.grey[400], child: SafeArea(child: QRCode())),
          '/animation': (context) => Container(color: Colors.grey[400], child: SafeArea(child: MyAnimation())),
          '/test': (context) => Container(color: Colors.grey[400], child: SafeArea(child: MyTest())),
        },
        theme: ThemeData(
            primaryColor: Colors.grey[900],
            accentColor: Colors.grey[400],
            canvasColor: Colors.grey[900],
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 20, color: Colors.grey[400], fontWeight: FontWeight.w500)
            ),
        ),
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      drawer: Container(
        color: Colors.grey[900],
        child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/avt.png'),
                      radius: 30.0,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.account_box_outlined,
                          color: Colors.grey[400],
                          size: 15.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          user.name,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.grey[400],
                          size: 15.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          user.email,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                ),
              ),
              ListTile(
                title: Text(
                  'QR Code',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                leading: Icon(
                  Icons.qr_code,
                  color: Colors.grey[400],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushNamed(context, '/qr');
                },
              ),
              ListTile(
                title: Text(
                  'Animation Demo',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                leading: Icon(
                  Icons.animation,
                  color: Colors.grey[400],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushNamed(context, '/animation');
                },
              ),
              ListTile(
                title: Text(
                  'Test',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                leading: Icon(
                  Icons.wine_bar,
                  color: Colors.grey[400],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushNamed(context, '/test');
                },
              ),
              Ink(
                color: Colors.red,
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.grey[400]),
                  title: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    print('Sign out pressed');
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            level++;
          });
        },
        child: Icon(Icons.add, color: Colors.grey[400],),
        backgroundColor: Colors.grey[850],
      ),
      body: Body(),
    );
  }
}