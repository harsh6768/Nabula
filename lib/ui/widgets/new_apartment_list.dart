import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:resort_app/model/new_apartment.dart';

class ApartmentList extends StatefulWidget {
  final String dataFile;
  ApartmentList({this.dataFile});

  @override
  _ApartmentListState createState() => _ApartmentListState();
}

class _ApartmentListState extends State<ApartmentList> {
  var category = NewApartment();

  List<NewApartment> newApartmentList;

  Future<List<NewApartment>> parseJsonFromAssets({String assetsPath}) async {
    return rootBundle.loadString(widget.dataFile).then((jsonStr) {
      var jsonResponse = json.decode(jsonStr);

      print(jsonResponse);
      newApartmentList = List<NewApartment>.from(
          jsonResponse.map((x) => NewApartment.fromJson(x)));
      return Future.value(newApartmentList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.1,
      child: FutureBuilder(
        future: parseJsonFromAssets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newApartmentList.length,
                itemBuilder: (BuildContext context, int index) {
                  var isForSale= newApartmentList[index].forSale ?"For Sale":"For Rent";
                  var bgColor=newApartmentList[index].forSale ? Color.fromRGBO(108, 205, 197, 1.0):Color.fromRGBO(67, 72, 155, 1.0);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 20.0),
                            margin: EdgeInsets.only(
                              right: 8.0,
                              top: 10.0,
                            ),
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.width / 2,
                            decoration: new BoxDecoration(
                              color: Color.fromRGBO(67, 72, 155, 1.0),
                              borderRadius: BorderRadius.circular(20.0),
                              image: new DecorationImage(
                                image: new AssetImage(
                                  '${newApartmentList[index].imageUrl}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 20.0,
                              left: MediaQuery.of(context).size.width / 1.4,
                            ),
                            child: Image.asset(
                              'assets/images/bookmark1.png',
                              height: 30.0,
                              width: 30.0,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 8.0,
                              top: MediaQuery.of(context).size.height / 4.8,
                            ),
                            height: 35,
                            width: 100,
                            decoration: new BoxDecoration(
                              color: bgColor ,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                isForSale,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2.7,
                              child: Text(
                                '${newApartmentList[index].villaName}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.9,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  '${newApartmentList[index].price}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Color.fromRGBO(204, 203, 211, 1.0),
                                  ),
                                  Text(
                                    '${newApartmentList[index].location}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color.fromRGBO(204, 203, 211, 1.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.1,
                              // padding: EdgeInsets.only(right: 0.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  '${newApartmentList[index].area}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        height: 1.0,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: new BoxDecoration(
                          color: Color.fromRGBO(204, 203, 211, 1.0),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.only(top: 10.0, left: 8.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width: 30,
                                    margin: EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      'assets/images/bed.png',
                                    ),
                                  ),
                                  Text('${newApartmentList[index].roomCount}')
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width: 30,
                                    margin: EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      'assets/images/bathtub.png',
                                    ),
                                  ),
                                  Text('${newApartmentList[index].poolCount}')
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width: 30,
                                    margin: EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      'assets/images/stairs.png',
                                    ),
                                  ),
                                  Text('${newApartmentList[index].stairsCount}')
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 40,
                                    margin: EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      'assets/images/car.png',
                                    ),
                                  ),
                                  Text(
                                      '${newApartmentList[index].vehicleCount}')
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                });
          } else {
            return Container(
              height: 60.0,
              width: 60.0,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
