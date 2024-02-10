import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:leaderboard1/provider.dart';

import 'package:provider/provider.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int i = 0;
  Color my = Colors.brown, CheckMyColor = Colors.white;

  final _controller = StreamController<dynamic>();

  static get http => null;

  String apiUrl =
      "https://e811e307-bc1a-4f80-8e1f-af2d64f41348.mock.pstmn.io/leaderboard";

  Future<dynamic> fetchData() async {
    try {
      var apicaller = await get(Uri.parse(
          "https://e811e307-bc1a-4f80-8e1f-af2d64f41348.mock.pstmn.io/leaderboard"));

      Map<String, dynamic> data = jsonDecode(apicaller.body);
      String region = data['region'];
      List<dynamic> leaders = data['leaders'];

      // Now you can access data like data['region'] and data['leaders']
      // For example:

      return leaders;
    } catch (e) {
      // Handle errors here
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var r = TextStyle(color: Colors.purpleAccent, fontSize: 34);
    return Stack(
      children: <Widget>[
        Scaffold(
            body: Container(
          margin: EdgeInsets.only(top: 65.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15.0, top: 10.0),
                child: RichText(
                    text: TextSpan(
                        text: "Leader",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: " Board",
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Region: Kozhikode',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              //Future Builder
              Expanded(
                  child: FutureBuilder(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data);

                          return ListView.builder(
                              //listview builder
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: InkWell(
                                    onTap: () {
                                      showBottomSheet(
                                        context: context,
                                        builder: (context) => Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              28.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                                Icons.close,
                                                                size: 43),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                        radius: 50,
                                                        backgroundImage:
                                                            NetworkImage(
                                                          "${snapshot.data[index]["profilePic"]}",
                                                        )),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        " ${snapshot.data[index]["name"]}",
                                                        style: TextStyle(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                78, 64, 64),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    Text(
                                                        "user Id: ${snapshot.data[index]["userId"]}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                78, 64, 64),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          "Points: ${snapshot.data[index]["points"]}",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  78, 64, 64),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 50),
                                                      child: Consumer<
                                                          Providerclass>(
                                                        builder: (context,
                                                                providermodal,
                                                                child) =>
                                                            InkWell(
                                                          onTap: () async {
                                                            await providermodal
                                                                .Colorchangefn();
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                color:
                                                                    providermodal
                                                                        .color),
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 50,
                                                            child: Center(
                                                              child: SizedBox(
                                                                child: Expanded(
                                                                  child: Text(
                                                                    "Challenge",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            30),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white,
                                              width: 3.0,
                                              style: BorderStyle.solid),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0, left: 15.0),
                                                child: CircleAvatar(
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    "${snapshot.data[index]["profilePic"]}"
                                                                        .toString()),
                                                                fit: BoxFit
                                                                    .fill)))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0, top: 10.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "userId: ${snapshot.data[index]["userId"]}",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .deepPurple,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          maxLines: 6,
                                                        )),
                                                    Text(
                                                        "${snapshot.data[index]["name"]}"
                                                            .toString())
                                                  ],
                                                ),
                                              ),
                                              Flexible(child: Container()),
                                              Text(
                                                "Points:${snapshot.data[index]["points"]}",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 102, 44),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }))
            ],
          ),
        )),
      ],
    );
  }
}
