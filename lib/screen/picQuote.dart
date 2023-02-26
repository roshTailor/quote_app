import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';

class PicQuote extends StatefulWidget {
  const PicQuote({Key? key}) : super(key: key);

  @override
  State<PicQuote> createState() => _PicQuoteState();
}

class _PicQuoteState extends State<PicQuote> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    String index = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          index,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,fontFamily: "lobster"
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(children: [
        ...list
            .map((e) =>
        (index == e['category'])
            ? Card(
          margin: const EdgeInsets.all(10),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 240,
            width: w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(
                            (Random().nextDouble() * 0xFFFFFF)
                                .toInt())
                            .withOpacity(0.3),
                        image: DecorationImage(
                            image: NetworkImage("${e['bgImg']}"),
                            fit: BoxFit.cover,
                            opacity: 0.8),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${e['quote']},",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: h / 80,
                          ),
                          Text(
                            "- ${e['author']}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.file_download,
                          color: Colors.green,
                          size: 30,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.blue,
                          size: 30,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.red,
                          size: 25,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
            : Container())
            .toList(),
        ...list
            .map((e) =>
        (index == 'Pic Quotes')
            ? Card(
          margin: const EdgeInsets.all(10),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 240,
            width: w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(
                            (Random().nextDouble() * 0xFFFFFF)
                                .toInt())
                            .withOpacity(0.3),
                        image: DecorationImage(
                            image: NetworkImage("${e['bgImg']}"),
                            fit: BoxFit.cover,
                            opacity: 0.8),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${e['quote']},",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: h / 80,
                          ),
                          Text(
                            "- ${e['author']}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.file_download,
                          color: Colors.green,
                          size: 30,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.blue,
                          size: 30,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.red,
                          size: 25,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
            : Container())
            .toList(),
        ...list
            .map((e) =>
        (index == e['author'])
            ? Card(
          margin: const EdgeInsets.all(10),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 240,
            width: w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(
                            (Random().nextDouble() * 0xFFFFFF)
                                .toInt())
                            .withOpacity(0.3),
                        image: DecorationImage(
                            image: NetworkImage("${e['bgImg']}"),
                            fit: BoxFit.cover,
                            opacity: 0.8),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${e['quote']},",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: h / 80,
                          ),
                          Text(
                            "- ${e['author']}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.file_download,
                          color: Colors.green,
                          size: 30,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.blue,
                          size: 30,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.red,
                          size: 25,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
            : Container())
            .toList()
      ]),

    );
  }
}
