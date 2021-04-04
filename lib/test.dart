import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyTest extends StatelessWidget {
  Future getHttp() async {
    Response response;
    var formData = FormData.fromMap({
      'email': 'thien.huynh21@hcmut.edu.vn',
      'password': 'Ohyeahbaby123'
    });
    response = await Dio().post("http://103.92.30.200:2100/login",data:formData);
    if(response.statusCode==200)
    {
      print(response.data);
      print(response.data);
    }
    else
    {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getHttp();
          },
          child: Text('Press'),
        ),
      ),
    );
  }
}
