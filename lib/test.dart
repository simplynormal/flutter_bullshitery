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
    print(response.data);
    print(response.statusCode);
    if(response.data['status'] != -1)
    {
      Map data = response.data;
      print(data['access_token']);
      print(data['user']['user_lname'] + ' ' + data['user']['user_fname']);
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
        centerTitle: true,
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
