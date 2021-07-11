import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:railway_admin/dashboard2.dart';
import 'package:flutter/src/widgets/icon.dart' as iconsimp;
import 'package:railway_admin/ui/dashboard.dart';

dynamic responsedata1;
dynamic responsedata2;
dynamic responsedata3;
Polyline myPolyline;
int refresher = 0;
bool refresh = true;
int counter = 0;
int counter1 = 0;
int counter2 = 0;
LatLng train1 = LatLng(30.06460723927716, 31.25022562739004);
LatLng train2 = LatLng(30.06460723927716, 31.25022562739004);
LatLng train3 = LatLng(28.096427875759424, 30.751405415724406);
LatLng traina1 = LatLng(30.06460723927716, 31.25022562739004);
LatLng traina2 = LatLng(30.06460723927716, 31.25022562739004);
LatLng traina3 = LatLng(28.096427875759424, 30.751405415724406);

class Map extends StatefulWidget {
  const Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getrainlocation();
      if (refresh == true) {
        counter++;
        counter1++;
        counter2++;

        await Future.delayed(const Duration(seconds: 5), () {
          checkcounter();
          //    checkcounter1();
          getrainlocationa();
          setState(() {
            refresher++;
          });

          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                builder: (context) => Dashboard2(),
              ));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(refresher.toString());
    return WillPopScope(
        onWillPop: () => refreshstate(),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            tooltip: "Stop Tracking",
            backgroundColor: Colors.red[700],
            child: iconsimp.Icon(
              Icons.stop,
              color: Colors.black,
            ),
            onPressed: () {
              refreshstate();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: Container(
            child: getMap(),
          ),
        ));
  }

  refreshstate() {
    setState(() {
      refresh = false;
      refresher = 0;
    });
  }

  checkcounter() {
    if (counter >= 91) {
      setState(() {
        counter = 0;
      });
    }
  }

  checkcounter1() {
    if (counter1 >= 65) {
      setState(() {
        counter1 = 0;
      });
    }
  }

  checkcounter2() {
    if (counter1 >= 24) {
      setState(() {
        counter2 = 0;
      });
    }
  }

  Widget getMap() {
    //A unique id to name the div element
    String htmlId = "6";
    //creates a webview in dart
    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final latLang = LatLng(30.010296924484695, 31.20634973839642);
      //class to create a div element

      final mapOptions = MapOptions()
        ..zoom = 8
        ..tilt = 90
        ..center = latLang;
      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = "none";

      dynamic map = GMap(elem, mapOptions);
      Polyline(PolylineOptions()
        ..map = map
        ..path = [
          LatLng(31.218610752908937, 29.942156790466374),
          LatLng(31.031580857134745, 30.488025875983332),
          LatLng(30.783109054618496, 30.993628700680027),
          LatLng(30.499529362952416, 31.16089471138503),
          LatLng(30.06460723927716, 31.25022562739004)
        ]);
      Marker(MarkerOptions()
        ..position = traina1
        ..map = map
        ..title = 'Train 304'
        ..icon = 'assets/images/train_png1.png'
        ..clickable = true);
      /*   Marker(MarkerOptions()
        ..position = traina2
        ..map = map
        ..title = 'Train 407'
        ..icon = 'assets/images/train_png1.png');
      Marker(MarkerOptions()
        ..position = traina3
        ..map = map
        ..title = 'Train 502'
        ..icon = 'assets/images/train_png1.png'); */

      return elem;
    });

    //creates a platform view for Flutter Web
    return HtmlElementView(
      viewType: htmlId,
    );
  }

  getrainlocation() async {
    dynamic response = await rootBundle.loadString('/json/1.json');
    dynamic responsedata = await json.decode(response);

    num loclat = responsedata[counter.toString()]['lat'];
    num loclng = responsedata[counter.toString()]['lng'];
    LatLng loc = LatLng(loclat, loclng);
    print("lat: " + loc.lat.toString() + " ,lng: " + loc.lng.toString());
    setState(() {
      train1 = loc;
      responsedata1 = responsedata;
    });
  }

  getrainlocation1() async {
    dynamic response =
        await rootBundle.loadString('assets/json/cairogiza.json');
    dynamic responsedata = await json.decode(response);
    LatLng loc = LatLng(responsedata[counter1.toString()]['lat'],
        responsedata[counter1.toString()]['lng']);

    setState(() {
      train2 = loc;
      responsedata2 = responsedata;
    });
  }

  getrainlocation3() async {
    dynamic response = await rootBundle.loadString('assets/json/minyaass.json');
    dynamic responsedata = await json.decode(response);
    LatLng loc = LatLng(responsedata[counter2.toString()]['lat'],
        responsedata[counter2.toString()]['lng']);

    setState(() {
      train3 = loc;
      responsedata3 = responsedata;
    });
  }

  getrainlocationa() {
    LatLng locaa = LatLng(responsedata1[counter.toString()]['lat'],
        responsedata1[counter.toString()]['lng']);
    print("lat: " + locaa.lat.toString() + " ,lng: " + locaa.lng.toString());
    setState(() {
      traina1 = locaa;
    });
  }

  getrainlocationa1() {
    LatLng locaa = LatLng(responsedata2[counter1.toString()]['lat'],
        responsedata2[counter1.toString()]['lng']);

    setState(() {
      traina2 = locaa;
    });
  }

  getrainlocationa3() {
    LatLng loc = LatLng(responsedata3[counter2.toString()]['lat'],
        responsedata3[counter2.toString()]['lng']);

    setState(() {
      traina3 = loc;
    });
  }
}
