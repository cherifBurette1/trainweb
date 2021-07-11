import 'package:flutter/material.dart';
import 'package:railway_admin/dashboard2.dart';
import 'package:railway_admin/dashboard3.dart';
import 'package:railway_admin/utils/global_vars.dart';
import 'ApiFunctions/Api.dart';
import 'models/trainss.dart';
import "package:fluttertoast/fluttertoast.dart";
import 'map.dart';

List<Trainss> trains = [
  Trainss(id: "0", type: "VIP 715"),
  Trainss(id: "1", type: "Turbo 212"),
  Trainss(id: "2", type: "Speed 410"),
  Trainss(id: "3", type: "Special 420"),
  Trainss(id: "4", type: "Special 2"),
  Trainss(id: "5", type: "French 50"),
];
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class PreMap extends StatefulWidget {
  const PreMap({Key key}) : super(key: key);

  @override
  _PreMapState createState() => _PreMapState();
}

class _PreMapState extends State<PreMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          heightFactor: 50,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  hint: Text(
                    "Choose train to track",
                    style: TextStyle(
                        // color: Color(0xffb8c3cb).withOpacity(0.5),
                        ),
                  ),
                  icon:
                      Icon(Icons.keyboard_arrow_down, color: Color(0xffb8c3cb)),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.grey[200],
                  style: TextStyle(color: Colors.black),
                  value: trains212,
                  onChanged: (newValue) {
                    setState(() {
                      trains212 = newValue;
                      print(trains212);
                    });
                  },
                  items: trains.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem.id,
                      child: Text(valueItem.type),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                child: RaisedButton(
                  color: Color(0xff173059),
                  onPressed: () async {
                    print(trains212.toString());

                    if (trains212 == "0") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dashboard2()));
                    } else if (trains212 == "1") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dashboard3()));
                    } else if (trains212 == "2") {
                      Fluttertoast.showToast(
                          msg: "tracking is not supported by this train!",
                          webBgColor:
                              "linear-gradient(to right, #ff0000, #ff0000)",
                          timeInSecForIosWeb: 2);
                    } else if (trains212 == "3") {
                      Fluttertoast.showToast(
                          msg: "tracking is not supported by this train!",
                          webBgColor:
                              "linear-gradient(to right, #ff0000, #ff0000)",
                          timeInSecForIosWeb: 2);
                    } else if (trains212 == "4") {
                      Fluttertoast.showToast(
                          msg: "tracking is not supported by this train!",
                          webBgColor:
                              "linear-gradient(to right, #ff0000, #ff0000)",
                          timeInSecForIosWeb: 2);
                    } else if (trains212 == "5") {
                      Fluttertoast.showToast(
                          msg: "tracking is not supported by this train!",
                          webBgColor:
                              "linear-gradient(to right, #ff0000, #ff0000)",
                          timeInSecForIosWeb: 2);
                    }
                  },
                  child: Text(
                    'Start Tracking',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
