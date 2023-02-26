import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/global.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quotes by category",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: "lobster"
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: uniqueList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('PicQuote',arguments: uniqueList[index]['category']);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor:
                        Color((Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.8),
                    child: Text(
                      "${uniqueList[index]['category'][0]}${uniqueList[index]['category'][1].toString().toUpperCase()}",
                      style: const TextStyle(fontSize: 18,fontFamily: "lobster"),
                    ),
                  ),
                  SizedBox(
                    width: w / 8,
                  ),
                  Text('${uniqueList[index]['category']}',
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 2,
            color: Colors.black12,
          );
        },
      ),
    );
  }
}
