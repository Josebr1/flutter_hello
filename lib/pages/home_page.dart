import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter'),
          centerTitle: true,
        ),
        body: _body());
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: _button(),
      ),
    );
  }

  _button() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        'OK',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: _onClickOK,
    );
  }

  void _onClickOK() {
    print('Clicou no botão!');
  }
  _img() {
    return Image.asset(
      "assets/images/dog4.png",
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      'Hello World',
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }
}
