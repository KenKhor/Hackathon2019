import 'dart:collection';

import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());
HashMap<int, HashMap<String,String>> inspector = new HashMap();
HashMap<int, List<double>> coords = new HashMap<int, List<double>>();
int searchedPostCode = 4000;
int checker = 0;

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
      home: MyHomePage(
          title: 'I N S P E C T A',
         ),

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          new Container(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  padding: const EdgeInsets.all(20.0),
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
                  child: Text("Inspector Account",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    )
                  ),
                ),

                new RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  textColor: Colors.white,
                  color: Colors.red,
                    onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchBar()),
                    );
                    },
                  child: new Text("Inspector Search",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )
                  ),
                ),
              ]
          ),
          new Container(
            height: 20,
          ),
//          Row(
//            children: <Widget>[
//              new RaisedButton(
//                padding:const EdgeInsets.all(8.0),
//                textColor: Colors.white,
//                color: Colors.red,
//                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => ThirdRoute()),
//                  );
//                },
//                child: new Text("MAP"),
//              ),
//            ],
//          ),
      Container(
        width: 400,
        height: 200,
        child: Image.asset(
          'images/add01.jpg',
          //'images/Unknown.jpg',
          fit: BoxFit.fitHeight,
        ),
      ),
//          Image.asset(
//            'images/Unknown.jpg',
//            width: 100,
//            height: 156,
//            fit: BoxFit.fitWidth,
//          ),
//          new Container(
//            height: 120.0,
//            width: 120.0,
//            decoration: new BoxDecoration(
//              image: DecorationImage(
//                image: new AssetImage(
//                    'images/maxresdefault.jpg'),
//                fit: BoxFit.fill,
//              ),
//            ),
//          ),
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          centerTitle: true,
          textTheme: TextTheme(
          title: TextStyle(
          color: Colors.white,
          fontSize: 30.0,)
          )
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
        title: Text('Inspector Account Creation'),
        backgroundColor: Colors.red[700],
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 40,
          ),
          new Container(
            height: 30,
            alignment: Alignment(0.0, 0.0),
            child: Text("Want to become an Inspector?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ))
          ),
          new Container(
            height: 40,
          ),
          new Container(
              height: 20,
              //alignment: Alignment(0.0, 0.0),
              child: Text("Enter Your details below to begin:")
          ),
          new Container(
            height: 40,
          ),
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
          new Container(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  submit();
                },
                child: new Text("Submit",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
              ),
              new RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 55.0),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: empty,
                child: new Text("Clear",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
            ],
          ),
          new Container(
              height: 40,
          ),
          new Container(
            height: 20,
              alignment: Alignment(0.0, 0.0),
              child: Text("Already have an Account? Click Below to Log in")
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new RaisedButton(
                padding: const EdgeInsets.all(4.0),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: submit,
                child: new Text("Log In"),
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
      title: 'Mapp',
      home: MyApp2(),
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

/**
* Implement GoogleMaps
 */

class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  Completer<GoogleMapController> _controller = Completer();

  static const coords = {4067: [-27.498456, 153.006001], 4068:
  [-27.501959, 152.974870], 4066: [-27.482627, 152.984983], 4064:
  [-27.466399, 153.007242], 4006: [-27.456323, 153.035119], 4000:
  [-27.470519, 153.024715]};


  //static const LatLng _center = const LatLng(-27.40125, 153.021072);


  //static const LatLng _center = const LatLng(-27.41125, 153.021072);

  LatLng _lastMapPosition;

  List<LatLng> posList = new List<LatLng>();

  final Set<Marker> _markers = {};


  MapType _currentMapType = MapType.normal;

  double offset = 0.01;
  double latitude = -27.41125;
  double longitude = 153.021072;

  void _setup() {
    for(var i in inspector.keys){
      String name = inspector[i].toString().substring(1,
          inspector[i].toString().length - 1);
      _onAddMarkerButtonPressed(i, name);

    }
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  LatLng _generateCenter() {
    List<double> init_lat_lang = coords[searchedPostCode];
    LatLng center = _generate_lat_lng(init_lat_lang[0], init_lat_lang[1]);
    return center;
  }

  double _generateZoom() {
    if (checker == 0) {
      return 11.0;
    }
    else {
      return 14.0;
    }
  }

  void _onAddMarkerButtonPressed(int coord, String name) {
    List<double> lat_lang = coords[coord];
    posList.add(_generate_lat_lng(lat_lang[0], lat_lang[1]));
//    HashMap<String, String> name = inspector[coord];
//    String nameS = name.toString();
//    String nameA = nameS.substring(1, nameS.length - 1);
    setState(() {
      //_markers.clear();

      _markers.add(Marker(
        markerId: MarkerId(_generate_lat_lng(lat_lang[0], lat_lang[1]).toString()),
        position: _generate_lat_lng(lat_lang[0], lat_lang[1]),
        infoWindow: InfoWindow(
          title: '$name',
          snippet: '$coord',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

//      for (LatLng pos in posList) {
//        _markers.add(Marker(
//          markerId: MarkerId(pos.toString()),
//          position: pos,
//          infoWindow: InfoWindow(
//            title: '$name',
//            snippet: 'email',
//          ),
//          icon: BitmapDescriptor.defaultMarker,
//        ));
//      }
    });
  }

  static LatLng _generate_lat_lng(double lat, double long) {
    var rng = new Random();
    int sign = rng.nextInt(4);
    double x = rng.nextDouble()/100;
    double y = rng.nextDouble()/100;

    double latitude = lat;
    double longitude = long;

    if (sign > 3) {
      latitude += x;
      longitude += y;
    } else if (sign > 2) {
      latitude -= x;
      longitude -= y;
    } else if (sign > 1) {
      latitude -= x;
      longitude += y;
    } else{
      latitude += x;
      longitude -= y;
    }
//    latitude += offset;
//    longitude += offset;

    return LatLng(latitude, longitude);

  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _setup();
  }

  @override
  Widget build(BuildContext context) {

//    posList.add(LatLng(-27.41125, 153.021072));
//    posList.add(LatLng(-27.3859, 153.0295));
    return MaterialApp(
      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Inspector Map'),
//          backgroundColor: Colors.red[700],
//        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _generateCenter(),
                zoom: _generateZoom(),
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget> [
                    FloatingActionButton(
                      heroTag: "btn1",
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.red,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                    SizedBox(height: 16.0),
                    /*
                    FloatingActionButton(
                      heroTag: "btn2",
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.add_location, size: 36.0),
                    ),

                     */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );


  }
}


class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: Example9(),
    );
  }
}

class Example9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Your Postcode"),
          backgroundColor: Colors.red[700],
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),

      drawer: Drawer(),
    body: MyApp2(),
    );

  }
}

class DataSearch extends SearchDelegate<String>{

  final cities = [
    "Saint Lucia, 4067",
    "Toowong, 4066",
    "Indooroopilly, 4068",
    "Milton, 4064",
    "Fortitude Valley, 4006",
  ];

  final recentCities = ["Saint Lucia, 4067"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
//    return Center(
//      child: Container(
//        height: 100.0,
//        width: 100.0,
//        child: Card(
//          color: Colors.red,
//          child: Center(
//            child: Text(query),
//          ),
//        ),
//      ),
//    );
      return MaterialApp(
        title: 'Mapp',
        home: MyApp2(),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionlist = query.isEmpty
        ? cities
        : cities.where((p)=> p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context,index)=> ListTile(
        onTap: (){
          showResults(context);
          int length = suggestionlist[index].length;
          String postCode = suggestionlist[index].substring(length - 4, length);
          searchedPostCode = int.parse(postCode);
          checker = 1;
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionlist[index].substring(0,query.length),
              style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold),
              children: [TextSpan(
                  text: suggestionlist[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount:suggestionlist.length,
    );
  }
}