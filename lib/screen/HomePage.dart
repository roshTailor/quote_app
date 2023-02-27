import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../utils/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Set<String> categories =
        Set<String>.from(list.map((item) => item['category']));
    uniqueList = categories.map((category) => {'category': category}).toList();
    print(uniqueList);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Quotes Saying",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "lobster"),
            ),
            SizedBox(
              width: w / 4.5,
            ),
            const Icon(
              Icons.notifications_active,
              color: Colors.yellow,
              size: 30,
            ),
            SizedBox(
              width: w / 20,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed("Like");
              },
              child: const Icon(
                CupertinoIcons.heart_fill,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              CupertinoIcons.line_horizontal_3,
              size: 25,
              color: Colors.black,
            ),
          ),
        ),
        titleSpacing: 2,
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            CarouselSlider(
              items: list.map((e) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage("${e['bgImg']}"),
                          fit: BoxFit.cover,
                          opacity: 0.8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${e['quote']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 1200),
              ),
            ),
            SizedBox(
              height: h / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: category
                  .map(
                    (e) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(e['route'], arguments: e['catName']);
                          },
                          child: Container(
                            height: h / 14,
                            width: w / 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: e['color'],
                            ),
                            child: Center(
                              child: Icon(
                                e['icon'],
                                size: 30,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h / 70,
                        ),
                        Text(
                          e['catName'],
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: CupertinoColors.black),
                        )
                      ],
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: h / 70,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Quotes by category",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black),
                ),
              ),
            ),
            SizedBox(
              height: h / 3.9,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2,
                physics: const NeverScrollableScrollPhysics(),
                children: uniqueList
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('PicQuote',
                                  arguments: e['category']);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color((Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                    .withOpacity(0.3),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                (e['category']),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Quotes by author",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black),
                ),
              ),
            ),
            SizedBox(
              height: h,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                physics: const NeverScrollableScrollPhysics(),
                children: list
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('PicQuote',
                                  arguments: e['author']);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color((Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                    .withOpacity(0.3),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                (e['author']),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: list.length,
            //       itemBuilder: (context, index) {
            //         return ListTile(
            //           title: Text("${list[index]['quote']}"),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(0.3),
              ),
              child: const Text("\nLife quotes and sayings",
                  style: TextStyle(fontSize: 32)),
            ),
            const ListTile(
              leading: Icon(
                Icons.topic,
                color: Colors.yellow,
              ),
              title: Text(' By Topic '),
            ),
            const ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text(' By Author '),
            ),
            const ListTile(
              leading: Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
              ),
              title: Text(' Favourites '),
            ),
            const ListTile(
              leading: Icon(
                Icons.workspace_premium,
                color: Colors.deepOrange,
              ),
              title: Text(' Quote of the day '),
            ),
            const ListTile(
              leading: Icon(
                Icons.ondemand_video_sharp,
                color: Colors.red,
              ),
              title: Text(' Videos '),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
