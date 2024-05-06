import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  List<String> navBarItem = ["Top News", "India", "World", "Finance", "Health"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TV24 NEWS"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            //Search Wala Container

            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if ((searchController.text).replaceAll(" ", "") ==
                        "") {
                      print("Blank search");
                    } else {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => Search(searchController.text)));
                    }
                  },
                  child: Container(
                    child: Icon(
                      Icons.search,
                      color: Colors.blueAccent,
                    ),
                    margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value){
                      print(value);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Health"),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: navBarItem.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    print(navBarItem[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text(navBarItem[index],
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                );
              }
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enableInfiniteScroll: false,
              enlargeCenterPage: true
            ),
            items: items.map((item){
              return Builder(
                builder: (BuildContext context){
                  return InkWell(
                    onTap: (){
                      print("text");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      decoration: BoxDecoration(
                        color: item
                      ),
                    ),
                  );
                }
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
  final List items = [Colors.blueAccent, Colors.orange, Colors.red];
}
