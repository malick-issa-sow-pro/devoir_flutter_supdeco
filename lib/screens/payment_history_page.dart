import 'package:flutter/services.dart';

import '/api_service.dart';
import '/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatefulWidget {
  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  List<User> users = [];
  List<String> dates = ['24th June 2024', '29th June 2024', '2nd July 2024'];

  String selectedMonth = 'June 2024';

  // Integrate your API SERVICE here
  // You only need to define where are your data come from
  // and ready.
  _getUsers() async {
    var temp = await ApiService.getUsers(nrUsers: 5);
    setState(() {
      users = temp;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Historique des paiements',
            style: TextStyle(color: Colors.black),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SafeArea(
          child: LayoutBuilder(
              builder: (_, constraints) => Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: <String>[
                              "janvier 2024 ",
                              " Février 2024 ",
                              " Mars 2024 ",
                              " Avril 2024 ",
                              " Mai 2024 ",
                              " Juin 2024 ",
                              " juillet 2024 ",
                              " Août 2024 ",
                              " Septembre 2024 ",
                              'Octobre 2024',
                              " Novembre 2024 ",
                              'Decembre 2024'
                            ].map((val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Container(
                                    color: Colors.white,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(val))),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                // TODO flutter 2 migration
                                selectedMonth = val.toString();
                              });
                            },
                            value: selectedMonth,
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            elevation: 0,
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListView(children: [
                          ...dates
                              .map((date) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(date,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Center(
                                        child: users.length == 0
                                            ? CupertinoActivityIndicator()
                                            : Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 8.0),
                                                color: Colors.white,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: users
                                                      .map((user) => Column(
                                                            children: <Widget>[
                                                              Row(
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            16.0),
                                                                    child:
                                                                        CircleAvatar(
                                                                      maxRadius:
                                                                          24,
                                                                      backgroundImage: NetworkImage(user
                                                                          .picture
                                                                          .thumbnail),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <Widget>[
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                16.0),
                                                                        child: Text(
                                                                            user.name.first +
                                                                                ' ' +
                                                                                user.name.last,
                                                                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                8.0,
                                                                            bottom:
                                                                                16.0),
                                                                        child:
                                                                            Text(
                                                                          user.phone,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Demander',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Spacer(),
                                                                  Column(
                                                                    children: <Widget>[
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: <Widget>[
                                                                          Text(
                                                                            '\$ ',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                                                          ),
                                                                          Text(
                                                                            '90.00',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            vertical:
                                                                                8.0),
                                                                        child: Text(
                                                                            '2:00 am',
                                                                            style:
                                                                                TextStyle(fontSize: 12, color: Colors.grey)),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            64.0),
                                                                child:
                                                                    Divider(),
                                                              )
                                                            ],
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ]),
                      ),
                    ],
                  )),
        ));
  }
}
