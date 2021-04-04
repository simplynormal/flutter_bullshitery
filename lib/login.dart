import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:dio/dio.dart';
import 'quote.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
  'asd@asd.com': 'asd'
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    Response response;
    var formData = FormData.fromMap({
      'email': data.name,
      'password': data.password,
    });
    response = await Dio().post("http://103.92.30.200:2100/login",data:formData);

    if (response.data['status'] == -1){
      switch (response.data['message']) {
        case 'Wrong Pwd': return 'Wrong password';
        case 'Wrong Acc': return 'Wrong account';
      }
    }

    user = UserInfo(response.data['user']['user_lname'] + ' ' + response.data['user']['user_fname'], data.name);
    return null;
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      logo: 'images/avt.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.pushNamed(context, '/');
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
