import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Main page'),
          backgroundColor: Colors.orangeAccent,),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        RaisedButton(
            color: Colors.deepOrangeAccent,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)),
            onPressed: (){Navigator.pushNamed(context, '/wish_page');}, child: Text('Open wish page')),
        RaisedButton(
            color: Colors.deepOrangeAccent,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)),
            onPressed: (){Navigator.pushNamed(context, '/wish_page/123');}, child: Text('Open wish page 123')),
      ],)),
    );
  }
}
// ignore: must_be_immutable
class WishPage extends StatelessWidget {
  String _id;
  WishPage({String id}):_id = id;
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Wish page $_id'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        RaisedButton(onPressed: () async {
          bool value = await Navigator.push(context, PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => MyPopup(),
              transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              }
          ));
          if (value) _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Bigger'), backgroundColor: Colors.green,));// TRUE
          else _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Less'), backgroundColor: Colors.red,));// FALSE
        }, child: Text('Please, wish your number'),
           shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black)),),
        RaisedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Move back'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black)),)
      ],)),
    );
  }
}


class MyPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Your answer:'),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)),
      actions: [
        FlatButton(
          onPressed: () {Navigator.pop(context,true);},
          child: Text('Bigger'),
          textColor: Colors.deepOrange,
        ),
        FlatButton(
          onPressed: () {Navigator.pop(context,false);},
          child: Text('Less'),
          textColor: Colors.deepOrange,
        ),
      ],
    );
  }
}


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(BuildContext context) => MainScreen(),
      '/wish_page':(BuildContext context) => WishPage()
    },
    // ignore: missing_return
    onGenerateRoute: (routeSettings){
      var path = routeSettings.name.split('/');
      if (path[1] == "wish_page") {
        return new MaterialPageRoute(
          builder: (context) => new WishPage(id:path[2]),
          settings: routeSettings,
        );
      }
    },
  ));
}