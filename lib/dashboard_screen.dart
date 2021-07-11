import 'ApiFunctions/Api.dart';
import 'models/allUsers_model.dart';
import 'models/trips.dart' as tripModelImport;
import 'responsive.dart';
import 'my_fields.dart';
import 'package:flutter/material.dart';
import 'MyFiles.dart';
import 'constants.dart';
import 'header.dart';
import 'recent_files.dart';
import 'storage_details.dart';
import 'models/trip.dart';
import 'package:railway_admin/models/stations.dart' as stationModelImport;
import 'package:railway_admin/models/trains_model.dart' as trainsModelImport;

int userCount = 0;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<CloudStorageInfo> demoo = List();

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  stationModelImport.StationsModel stationsModel;
  List<stationModelImport.Success> stationsList = List();
  trainsModelImport.TrainsModel trainsModel;
  List<trainsModelImport.Success> trainsList = List();
  tripModelImport.TripsModel tripsModel;
  List<Success> tripsList = List();
  List<Success> usersList = List();
  List<CloudStorageInfo> demoo = List();
/*   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 0), () async {
      await gettingData();
    });
//    showHud();
  }
 */
  gettingData() {
    setState(() {
      demoo.add(CloudStorageInfo(
          svgSrc: 'assets/icons/train1.svg',
          title: "Clients",
          numOfFiles: userCount,
          percentage: 35,
          color: Colors.blue,
          totalStorage: "Clients this Month"));
      demoo.add(CloudStorageInfo(
          svgSrc: 'assets/icons/train1.svg',
          title: "Clients",
          numOfFiles: userCount,
          percentage: 35,
          color: Colors.blue,
          totalStorage: "Clients this Month"));
      demoo.add(CloudStorageInfo(
          svgSrc: 'assets/icons/train1.svg',
          title: "Clients",
          numOfFiles: userCount,
          percentage: 35,
          color: Colors.blue,
          totalStorage: "Clients this Month"));
      demoo.add(CloudStorageInfo(
          svgSrc: 'assets/icons/train1.svg',
          title: "Clients",
          numOfFiles: userCount,
          percentage: 35,
          color: Colors.blue,
          totalStorage: "Clients this Month"));
      print(userCount);
    });

    print("hello2: " +
        demoo1[0].svgSrc +
        demoo1[0].title +
        demoo1[0].totalStorage +
        demoo1[0].color.toString() +
        demoo1[0].numOfFiles.toString() +
        demoo1[0].percentage.toString());
    setState(() {
      userCount = 0;
    });
  }

  gettingData2() {
    setState(() {
      Api(context).tripsApi(_scaffoldKey).then((value) {
        tripsModel = value;
        tripsModel.success.forEach((element) {
          setState(() {});
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StarageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StarageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
