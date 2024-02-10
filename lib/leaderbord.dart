import 'dart:async';

import 'package:flutter/material.dart';

import 'package:leaderboard1/provider.dart';

import 'package:provider/provider.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
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
                  "Region: Kozhikode",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              //Future Builder
              Expanded(
                  child: Consumer<Providerclass>(
                builder: (context, newpro, child) => FutureBuilder(
                    future: newpro.fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data);

                        return Column(
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "asset/king.png",
                                    height: 80,
                                    width: 80,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          "${snapshot.data[0]["profilePic"]}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 115.0, left: 50),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(color: Colors.red),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
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
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(28.0),
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
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            " ${snapshot.data[index]["name"]}",
                                                            style: TextStyle(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    78,
                                                                    64,
                                                                    64),
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
                                                                    .fromARGB(
                                                                    255,
                                                                    78,
                                                                    64,
                                                                    64),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                              "Points: ${snapshot.data[index]["points"]}",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      78,
                                                                      64,
                                                                      64),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
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
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    color: providermodal
                                                                        .color),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 50,
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
                                                                    child:
                                                                        Expanded(
                                                                      child:
                                                                          Text(
                                                                        "Challenge",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 30),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0,
                                                            left: 15.0),
                                                    child: CircleAvatar(
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        "${snapshot.data[index]["profilePic"]}"
                                                                            .toString()),
                                                                    fit: BoxFit
                                                                        .fill)))),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            top: 10.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                  }),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ))
            ],
          ),
        )),
      ],
    );
  }
}
