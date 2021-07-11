import 'constants.dart';
import 'package:flutter/material.dart';

int userCountvar = 0;
int trainCountvar = 0;
int stationCountvar = 0;
int tripsCountvar = 0;

class CloudStorageInfo {
  final String svgSrc, title, totalStorage;
  final int numOfFiles, percentage;
  final Color color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoo1;
List demoMyFiles = [
  CloudStorageInfo(
    title: "Clients",
    numOfFiles: userCountvar,
    svgSrc: 'assets/icons/train1.svg',
    totalStorage: " Clients on System",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Stations",
    numOfFiles: stationCountvar,
    svgSrc: 'assets/icons/train1.svg',
    totalStorage: " Trains on System",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Trains",
    numOfFiles: trainCountvar,
    svgSrc: 'assets/icons/train1.svg',
    totalStorage: " Trains on System",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Trips",
    numOfFiles: tripsCountvar,
    svgSrc: 'assets/icons/train1.svg',
    totalStorage: " Trips on System",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
