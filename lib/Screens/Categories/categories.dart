import 'package:flutter/material.dart';
import 'package:mimo/Screens/Categorydetail/CategoryDetail.dart';
import 'package:mimo/Screens/settings/Settings.dart';

class CategoryCard {
  late String title;
  late int Count;
  CategoryCard({required this.title, required this.Count});
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  List<CategoryCard> _cardlist = [
    CategoryCard(title: 'Home', Count: 10),
    CategoryCard(title: 'Sport', Count: 13),
    CategoryCard(title: 'Homework', Count: 15),
    CategoryCard(title: 'E-learning', Count: 3),
    CategoryCard(title: 'Shopping', Count: 8),
    CategoryCard(title: 'Food', Count: 9),
    CategoryCard(title: 'Design', Count: 10),
  ];
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ),
        title: Text(
          'Categories',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 6),
            child: Card(
              elevation: 3,
              surfaceTintColor: Colors.white,
              shape: LinearBorder(),
              child: Container(
                height: mediaQuery.size.height * 0.15,
                width: mediaQuery.size.width * 0.95,
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    title: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      '"The memories is a shield and life helper"',
                      style: TextStyle(
                          fontFamily: 'Italic',
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Tamim-Al-Barghouti',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.05,
          ),
          Expanded(
              child: GridView.builder(
            itemCount: _cardlist.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 5),
            itemBuilder: (BuildContext context, int index) {
              final CategoryCard _card = _cardlist[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryDetail()));
                },
                child: Card(
                  shape: LinearBorder(),
                  elevation: 5,
                  child: Container(
                      constraints:
                          BoxConstraints(minHeight: 150, minWidth: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${_card.title}',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            '${_card.Count} tasks',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert)),
                            ),
                          )
                        ],
                      )),
                ),
              );
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: const Color.fromARGB(233, 31, 30, 30),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
