import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:testes_fab/custom_fab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _controller = ScrollController();
  bool _fabExtended;

  @override
  void initState() {
    _controller.addListener(_scrollListener);
    _fabExtended = true;
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _fabExtended = !_fabExtended;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _fabExtended = !_fabExtended;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scroll Limit reached"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("Index : $index"));
                },
              ),
            ),
          ],
        ),
        // floatingActionButton: _fabExtended
        //     ? CustomFab(isExtended: _fabExtended)
        //     : CustomFab(isExtended: _fabExtended),
        // floatingActionButton: SpeedDial(
        //   children: [
        //     SpeedDialChild(
        //       child: Icon(Icons.add),
        //       label: "Agendar agora",
        //       onTap: () => print("Press Agendar agora"),
        //     ),
        //     SpeedDialChild(
        //       child: Icon(Icons.article),
        //       label: "Agendar por chatbot",
        //       onTap: () => print("Press Agendar Chatbot"),
        //     ),
        //     SpeedDialChild(
        //       child: Icon(Icons.assessment),
        //       label: "Agendar por whatsapp",
        //       onTap: () => print("Press Agendar WhatsApp"),
        //     ),
        //     SpeedDialChild(
        //       child: Icon(Icons.arrow_circle_down),
        //       label: "Agendar por ligacao",
        //       onTap: () => print("Press Agendar Ligacao"),
        //     )
        //   ],
        // ),
        floatingActionButton: _fabExtended
            ? FloatingActionButton.extended(
                onPressed: null,
                key: UniqueKey(),
                label: Text("Text"),
                icon: Icon(Icons.add),
              )
            : FloatingActionButton(
                onPressed: null,
                key: UniqueKey(),
                child: Icon(Icons.add),
              ));
  }
}
