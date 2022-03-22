import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:designscreen/Models/coins.dart';
import 'package:designscreen/Screen/coin_card.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:designscreen/Animation/home_register.dart';
import 'package:designscreen/Screen/home.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List apidata = [];
  List search = [];

  final searchCryto = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCpyto();
  }

  Future<List<Coins>> getCpyto() async {
    try {
      coinlist = [];
      const apiURL =
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h';

      final response = await http.get(Uri.parse(apiURL));

      if (response.statusCode == 200) {
        ///////////////////////////////////////////////////////
        var values = [];
        values = json.decode(response.body);
        if (values.isNotEmpty) {
          for (int i = 0; i < values.length; i++) {
            if (values[i] != null) {
              Map<String, dynamic> map = values[i];
              coinlist.add(Coins.fromJson(map));
            }
          }
        }
        ////////////////////////////////////////////////////////
        List a = values.map<Coins>((json) => Coins.fromJson(json)).toList();
        //////////////////////////////////////////////////////
        setState(() {
          coinlist;
          apidata = a;
          //search = a;
        });
      }
    } catch (e) {
      print(e);
    }

    return coinlist;
  }

  @override
  Widget build(BuildContext context) {
    double paddingAppbar = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: EdgeInsets.only(
            top: paddingAppbar + 15, right: 15, left: 15, bottom: 15),
        child: TextField(
          onChanged: ((value) {
            print(value);
            if (value.isEmpty) {
              getCpyto();
            }
            setState(() {
              searchCryptoFun(value);
            });
          }),
          /*onEditingComplete: () async {
            await getCpyto();
            searchCryptoFun(searchCryto.text);
          },*/
          controller: searchCryto,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffixIcon: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                getCpyto();
                searchCryto.clear();
              },
            ),
          ),
        ),
      ),
      Expanded(
        child: apidata.isNotEmpty
            ? ListView.builder(
                itemCount: apidata.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemBuilder: (context, index) {
                  final V = apidata[index];
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(4, 4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                height: 65,
                                width: 65,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.network(V.imageUrl.toString()),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    V.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    V.symbol,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  V.price.toDouble().toString() + ' USD',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  V.change.toDouble().toString(),
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 215, 255, 104),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  V.changePercen.toDouble().toString() + ' %',
                                  style: TextStyle(
                                      color: apidata[index].changePercen > 0
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : loadingCrypto(),
      )
    ]));
  }

  loadingCrypto() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Data', textScaleFactor: 3),
          ElevatedButton(
              onPressed: () {
                getCpyto();
                searchCryto.clear();
              },
              child: Text('Refresh'))
        ],
      ),
    );
  }

  searchCryptoFun(String query) {
    /*for (var i in apidata) {
      if (i.name.toString().toLowerCase().contains(query.toLowerCase())) {
        print(i.name);
      }
    }*/

    if (query.isNotEmpty) {
      var testSearch = apidata.where((V) {
        return V.name.toString().toLowerCase().contains(query.toLowerCase());
      }).toList();

      setState(() {
        apidata = testSearch;
      });
    }

    /*final suggestions = apidata.where((V) {
      final cryptoTitle = V.name.toLowerCase();
      final input = query.toLowerCase();

      return cryptoTitle.contains(input);
    }).toList();

    setState(() {
      apidata = suggestions;
    });

    print(searchCryto.text);

    if (suggestions.isEmpty && query.isNotEmpty) {
      print('1');
      getCpyto().whenComplete(() {
        setState(() {
          apidata;
        });
      });
    } else if (suggestions.isNotEmpty && query.isEmpty) {
      print('2');
      getCpyto().whenComplete(() {
        setState(() {
          apidata;
        });
      });
    }  else if (searchCryto.value.composing.end >= 1) {
      getCpyto().then((value) => searchCryptoFun(query));
    }*/

    /*if (suggestions.isEmpty || searchCryto.text.isEmpty) {
      getCpyto();
    }*/

    //return getCpyto();
  }
}
