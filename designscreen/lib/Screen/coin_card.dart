/* import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercen;

  CoinCard(
      {Key? key,
      required this.name,
      required this.symbol,
      required this.imageUrl,
      required this.change,
      required this.changePercen,
      required this.price})
      : super(key: key);


  @override
  Widget build(BuildContext context) {


    // sort 


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
                offset: Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
              BoxShadow(
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
                    child: Image.network(imageUrl),
                  )),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      symbol,
                      style: TextStyle(
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
                    price.toDouble().toString()+' USD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    change.toDouble().toString(),
                    style: TextStyle(
                        color: Color.fromARGB(255, 215, 255, 104),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    changePercen.toDouble().toString(),
                    style: TextStyle(
                        color: changePercen > 0 ? Colors.green : Colors.red,
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
  }
}
*/