import 'package:flutter/material.dart';
import 'package:railway_admin/getmap.dart';

class Map extends StatelessWidget {
  const Map({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getMap(),
    );
  }
}
