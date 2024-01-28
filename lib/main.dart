import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furniture_store/grid_items.dart';
import 'package:furniture_store/product_details.dart';
import 'category_model.dart';
import 'header.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  List<String> categories = ["All", "Chairs", "Sofas", "Tables", "Beds"];

  Widget getCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 2, bottom: 2, right: 20),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedIndex == index
                  ? const Color(0xFFC2D8FD)
                  : Colors.transparent,
              width: 2),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color(0xFFE7EEF8),
                blurRadius: 1,
                offset: Offset(2.6, 2.6))
          ],
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              categories[index],
              style: const TextStyle(
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFF8F8F8),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: <Widget>[
                header(context),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  height: 50,
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color(0xFFE7EEF8),
                          blurRadius: 1.0,
                          offset: Offset(2.6, 2.6))
                    ],
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45.0),
                      bottomLeft: Radius.circular(45.0),
                    ),
                  ),
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.search),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 40,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categories
                          .asMap()
                          .entries
                          .map((MapEntry map) => getCategories(map.key))
                          .toList()),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: StaggeredGrid.count(
                      crossAxisCount: 4,
                      // staggeredTiles: categoriesGrid
                      //     .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                      //     .toList(),
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      children:
                          categoriesGrid.asMap().entries.map((MapEntry map) {
                        int index = map.key;
                        return GestureDetector(
                            onTap: () {
                              debugPrint(categoriesGrid[index].toString());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(categoriesGrid[index])),
                              );
                            },
                            child: GridItems(index));
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
