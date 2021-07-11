import 'package:flutter/material.dart';
import 'package:railway_admin/ApiFunctions/Api.dart';
import 'package:railway_admin/dashboard_screen.dart';
import 'package:railway_admin/models/allUsers_model.dart';
import 'package:railway_admin/ui/home.dart';
import 'package:railway_admin/utils/colors_file.dart';

import '../../MyFiles.dart';
import '../../utils/colors_file.dart';
import '../../utils/colors_file.dart';

bool loader = false;
var walletController = TextEditingController();

class Clients extends StatefulWidget {
  @override
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  AllUsersModel allUsersModel;
  List<Success> usersList = List();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Success> tripsListForDisplay = List();
  List<Success> _searchResult = [];
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var phoneCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 0), () {
      gettingData();
    });
//    showHud();
  }

  List<dynamic> hospitals = [];
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    usersList.forEach((userDetail) {
      if (userDetail.name.contains(text)) _searchResult.add(userDetail);
    });

    setState(() {});
  }

  gettingData() {
    setState(() {
      Api(context).allUsersApi(_scaffoldKey).then((value) {
        allUsersModel = value;
        allUsersModel.success.forEach((element) {
          setState(() {
            usersList.add(element);
            tripsListForDisplay = usersList;
          });
        });
        setState(() {
          userCountvar = usersList.length;
          print(userCountvar);
        });
        // usersList = usersList.reversed.toList();
      });
    });
  }

  String value;
  List items = [
    "view",
    "update",
    "delete",
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Scaffold(
        key: _scaffoldKey,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            usersList.length == 0
                ? Center(
                    child: Container(
                      child: Text("The System Has No Users Yet . "),
                    ),
                  )
                : Container(
                    // color: Colors.red,

                    width: MediaQuery.of(context).size.width / 2.5,

                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 30),
                        child: SizedBox(
                          height: 60,
                          child: Column(children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              onChanged: (text) {
                                setState(() {
                                  text = text.toLowerCase();
                                  tripsListForDisplay =
                                      usersList.where((element) {
                                    var title = element.name.toLowerCase();
                                    return title.contains(text);
                                  }).toList();
                                });
                              },
                              cursorColor: primaryAppColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none),
                                fillColor: primaryAppColor.withOpacity(0.1),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: blueAppColor)),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                hintText: "Find the client by name",
                                hintStyle: TextStyle(color: Colors.black),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                // enabledBorder: InputBorder.none,
                                // border: OutlineInputBorder(
                                //     borderSide:
                                //         BorderSide(color: primaryAppColor, width: .8)),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: tripsListForDisplay.length,
                        itemBuilder: (ctx, index) {
                          return UserBody(context, _scaffoldKey,
                              tripsListForDisplay[index]);
                        },
                      ),
                    ]),
                  ),
            VerticalDivider(
              thickness: 5,
              width: 10,
              color: primaryAppColor,
            ),
            SingleChildScrollView(
              child: Container(
                  alignment: Alignment.topLeft,
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(bottom: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Clients Information",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Text(
                              "Count :",
                              style: TextStyle(fontSize: 18),
                            ),
                            title: Text(
                              usersList.length.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: TextFormField(
                              controller: nameController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              // validator: validateName,
                              style: TextStyle(color: blackColor),
                              cursorColor: primaryAppColor,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.withOpacity(.1),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  hintText: 'Name',
                                  hintStyle:
                                      TextStyle(color: greyPrimaryColor)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: TextFormField(
                              controller: phoneController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              // validator: validateName,
                              style: TextStyle(color: blackColor),
                              cursorColor: primaryAppColor,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.withOpacity(.1),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  hintText: 'Phone',
                                  hintStyle:
                                      TextStyle(color: greyPrimaryColor)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: TextFormField(
                              controller: emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              // validator: validateName,
                              style: TextStyle(color: blackColor),
                              cursorColor: primaryAppColor,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.withOpacity(.1),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  hintText: 'Email',
                                  hintStyle:
                                      TextStyle(color: greyPrimaryColor)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: TextFormField(
                              controller: passwordController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              // validator: validateName,
                              style: TextStyle(color: blackColor),
                              cursorColor: primaryAppColor,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.withOpacity(.1),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  hintText: 'Password',
                                  hintStyle:
                                      TextStyle(color: greyPrimaryColor)),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 180,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Add Client",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Api(context).userRegister(
                                      _scaffoldKey,
                                      nameController.text,
                                      emailController.text,
                                      passwordController.text,
                                      passwordController.text,
                                      phoneController.text);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: blackColor,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: whiteColor,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Users() {
  //   return ListTile(
  //     contentPadding: EdgeInsets.only(left: 20, top: 5),
  //     leading: CircleAvatar(
  //       radius: 20,
  //       backgroundColor: primaryAppColor,
  //       backgroundImage: AssetImage(
  //         'images/profileImage.jpg',
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //       ),
  //     ),
  //     title: Text("Mohamed " "Ahmed"),
  //     subtitle: Text("mohamed.ahmed@gmail.com"),
  //     trailing: IconButton(
  //         onPressed: () {},
  //         icon: Container(
  //           alignment: Alignment.center,
  //           width: 350,
  //           height: 30,
  //           child: DropdownButton(
  //             icon: Icon(Icons.linear_scale_rounded, color: blackColor),
  //             isExpanded: true,
  //             underline: SizedBox(),
  //             dropdownColor: whiteColor,
  //             style: TextStyle(color: blackColor),
  //             value: value,
  //             onChanged: (newValue) {
  //               setState(() {
  //                 value = newValue;
  //                 value == "delete"
  //                     ? Navigator.push(context,
  //                         MaterialPageRoute(builder: (context) => Home()))
  //                     : null;
  //               });
  //             },
  //             items: items.map((valueItem) {
  //               return DropdownMenuItem(
  //                 value: valueItem,
  //                 child: Text(valueItem),
  //               );
  //             }).toList(),
  //           ),
  //         )),
  //   );
  // }

}

Widget UserBody(BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey,
    Success success) {
  return ListTile(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color(0xff1D1D1D),
              title: Text(
                success.name,
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff1D1D1D),
                              title: Text(
                                success.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Api(context).AddToWalletApi(
                                          _scaffoldKey,
                                          success.id.toString(),
                                          walletController.text);
                                    },
                                    child: Text(
                                      "Confirm",
                                    )),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "cancel",
                                    ))
                              ],
                              content: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Deposit",
                                        style: TextStyle(color: whiteColor),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: walletController,
                                        style: TextStyle(color: whiteColor),
                                        cursorColor: primaryAppColor,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide.none),
                                          fillColor:
                                              primaryAppColor.withOpacity(0.1),
                                          filled: true,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: blueAppColor)),
                                          hintText: "add here",
                                          hintStyle: TextStyle(
                                              color: greyPrimaryColor),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          // enabledBorder: InputBorder.none,
                                          // border: OutlineInputBorder(
                                          //     borderSide:
                                          //         BorderSide(color: primaryAppColor, width: .8)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Text(
                      "Add Wallet",
                    )),
                FlatButton(
                    onPressed: () {
                      Api(context).deleteUserApi(_scaffoldKey, success.id);
                    },
                    child: Text(
                      "delete",
                    )),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "cancel",
                    ))
              ],
              content: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Id:" + success.id.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email :" + success.email,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Phone :" + success.phoneNumber,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Wallet : " + success.wallet.toString() + "L.E",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Created at :  " +
                            success.createdAt.split(".")[0].split("T")[0] +
                            success.createdAt.split(".")[0].split("T")[1],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    },
    //   contentPadding: EdgeInsets.only(left: 20, top: 5),
    leading: CircleAvatar(
      radius: 20,
      backgroundColor: grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.person,
          color: whiteColor,
        ),
      ),
    ),
    title: Text(success.name),
    subtitle: Text(success.email),
  );
}
