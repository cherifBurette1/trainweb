import 'package:flutter/material.dart';

import 'constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Passengers' sex in the past week",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/icons/men.svg",
            title: "Men",
            amountOfFiles: "9082 person",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/women.svg",
            title: "Woman",
            amountOfFiles: "5004 person",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/children.svg",
            title: "children",
            amountOfFiles: "3076 person",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/toddlers.svg",
            title: "Toddlers",
            amountOfFiles: "276 person",
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
