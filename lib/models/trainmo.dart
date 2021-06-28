import 'package:flutter/material.dart';

class Trip {
  final String name;
  final int id, cara, seata, carb, seatb, number;

  Trip(
      {this.id,
      this.name,
      this.cara,
      this.seata,
      this.carb,
      this.seatb,
      this.number,
      String destination});
}
