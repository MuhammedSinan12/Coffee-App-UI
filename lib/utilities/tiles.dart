import 'package:flutter/material.dart';

class CoffeeTiles extends StatelessWidget {
  final String coffeepath;
  final String coffeename;
  final String coffeeprice;
  final String mixedwith;

  CoffeeTiles({
    required this.coffeepath,
    required this.coffeename,
    required this.coffeeprice,
    required this.mixedwith,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 15),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //image of Coffee
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(coffeepath),
          ),
          //coffee name
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffeename,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  mixedwith,
                  style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$" + coffeeprice),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Icon(Icons.add)),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
