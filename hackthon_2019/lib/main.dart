import 'dart:collection';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());
HashMap<int, HashMap<String,String>> inspector = new HashMap();
BuildContext currentContext;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Find an Inspector!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _info = "You haven't pressed the button";
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _displayInfo() {
    setState(() {
      _info = "ben pressed the button";
    });
  }

  void _reset() {
    setState(() {
      _info = "Button was Reset";
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    Widget selectSection = Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'What are you here for?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    /*
                    _navigateAndDisplayInspector();
                     */
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  },
                  child: new Text("I am an Inspector"),
                ),

                new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: _reset,
                  child: new Text("I am looking for an Inspector"),
                ),
              ]
          ),
          Row(
            children: <Widget>[
              new RaisedButton(
                padding:const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdRoute()),
                  );
                },
                child: new Text("MAP"),
              ),
            ],
          ),
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView(
            children: [
              Image.asset(
                'images/Unknown.jpg',
                width: 100,
                height: 156,
                fit: BoxFit.fitWidth,
              ),
              selectSection,

            ]

        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspector Information',
      home: InspectorForm(),
    );
  }
/*{
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }*/
}

class InspectorForm extends StatefulWidget {
  @override
  _InspectorFormState createState() => _InspectorFormState();
}

class _InspectorFormState extends State<InspectorForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final postcodeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    postcodeController.dispose();
    super.dispose();
  }

  void empty() {
    nameController.text = '';
    emailController.text = '';
    postcodeController.text = '';
  }

  void submit() {
    int postCode;
    postCode = int.parse(postcodeController.text);
    HashMap<String, String> information = new HashMap();
    String name;
    String email;
    name = nameController.text;
    email = emailController.text;
    if (inspector.containsKey(postCode)) {
      (inspector[postCode])[name] = email;
    }
    else {
      information[name] = email;
      inspector[postCode] = information;
    }
      print("$inspector");


  }
  @override
  Widget build(BuildContext context) {
    //currentContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspector Information'),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            'Your Name:',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          TextField(
            controller: nameController,
          ),
          Text(
            'Your Email',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          TextField(
            controller: emailController,
          ),
          Text(
            'Your Postcode',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          TextField(
            controller: postcodeController,
          ),
          Row(
            children: [
              new RaisedButton(
                padding: const EdgeInsets.all(4.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: submit,
                child: new Text("Submit"),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: empty,
                child: new Text("Clear"),
              ),
            ],
          ),
        ],
      ),
    );
    // TODO: implement build
    return null;
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspector Information',
      home: InspectorForm(),
    );
  }
/*{
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }*/
}
