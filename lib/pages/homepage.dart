import 'package:coffee_app/utilities/coffeee_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of coffee types
  final List coffeType = [
    //[coffeetype ,, isSelected]
    ['Cappucino', true],
    ['Latte', false],
    ['Black Coffe', false],
  ];

  //user tapped on types
  void coffeetypeselected(int index) {
    setState(() {
      //for loop makes selections to false
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[i][1] = false;
      }
      coffeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          //best Coffee
          Text(
            "Find the best Coffee for you",
            style: GoogleFonts.bebasNeue(fontSize: 50),
          ),
          const SizedBox(
            height: 20,
          ),
          //search bar

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find coffee",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          //list of coffee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeType.length,
              itemBuilder: (context, index) {
                return CoffeeTypes(
                  coffeetype: coffeType[index][0],
                  isSelected: coffeType[index][1],
                  onTap: () {
                    coffeetypeselected(index);
                  },
                );
              },
            ),
          ),

          //horizontal list of coffee
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTiles(
                mixedwith: "With Almond Milk",
                coffeepath: "lib/images/latte.jpg",
                coffeename: "Latte",
                coffeeprice: "4",
              ),
              CoffeeTiles(
                mixedwith: "With Milk",
                coffeepath: "lib/images/cappuccino.jpg",
                coffeename: "Cappucino",
                coffeeprice: "3.5",
              ),
              CoffeeTiles(
                mixedwith: "Without Milk",
                coffeepath: "lib/images/blackcoffe.jpg",
                coffeename: "Black Coffee",
                coffeeprice: "2",
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: 'Favourites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ]),
    );
  }
}
