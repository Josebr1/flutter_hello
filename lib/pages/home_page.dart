import 'package:flutter/material.dart';
import 'package:flutter_hello/drawer_list.dart';
import 'package:flutter_hello/pages/hello_listview.dart';
import 'package:flutter_hello/pages/hello_page1.dart';
import 'package:flutter_hello/pages/hello_page2.dart';
import 'package:flutter_hello/pages/hello_page3.dart';
import 'package:flutter_hello/utils/nav.dart';
import 'package:flutter_hello/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'TAB 1',
              ),
              Tab(
                text: 'TAB 2',
              ),
              Tab(
                text: 'TAB 3',
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _onClickFab();
          },
        ),
        drawer: DrawerList(),
      ),
    );
  }

  void _onClickFab() {
    print('Adicionar');
  }

  _body(context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton('ListView',
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton('Page 2',
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton('Page 3',
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton('Snack', onPressed: () => _onClickSnack(context)),
                BlueButton('Dialog', onPressed: () => _onClickDialog(context)),
                BlueButton('Toast', onPressed: _onClickToast),
              ],
            ),
          ],
        );
      },
    );
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Olá Flutter'),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.yellow,
        onPressed: () {
          print('Olá');
        },
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('Flutter é muito legal'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: 'This is center Short Toast',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print("$s");
  }

  _img(String img) {
    return Image.asset(
      img,
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
