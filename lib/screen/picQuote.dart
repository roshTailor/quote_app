import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/global.dart';

class PicQuote extends StatefulWidget {
  const PicQuote({Key? key}) : super(key: key);

  @override
  State<PicQuote> createState() => _PicQuoteState();
}

class _PicQuoteState extends State<PicQuote> {
  Future saveImage(Uint8List bytes) async {
    await ImageGallerySaver.saveImage(bytes, name: "data", quality: 100);
  }
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
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (counter < list.length) {
                                e['bgImage'] = list[counter]['image'];
                                counter++;
                              }
                            });
                          },
                          child: Icon(
                            Icons.change_circle_rounded,
                            color: Colors.blue,
                          )),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              likeQuote.add(e);
                              print(likeQuote);
                            });
                          },
                          child: const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FlutterClipboard.copy(
                              e['quote'].toString(),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copy")));
                          },
                          child: const Icon(
                            Icons.copy_rounded,
                            color: Colors.blueAccent,
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            final byte = await screenshotController.captureFromWidget(Material(
                              child: Stack(alignment: Alignment.center, children: [
                                Container(
                                  height: h,
                                  width: w,
                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${e['image']}"), fit: BoxFit.cover)),
                                  child: Center(
                                    child: Text(
                                      "${e['quote']}",
                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ]),
                            ));
                            final temp = await getTemporaryDirectory();
                            final path = '${temp.path}/image.jpg';
                            File(path).writeAsBytesSync(byte);
                            await Share.shareFiles([path]);
                          },
                          child: const Icon(
                            Icons.share,
                            color: Colors.red,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Uint8List? imageBytes = await screenshotController.captureFromWidget(
                              Stack(alignment: Alignment.center, children: [
                                Container(
                                  height: h,
                                  width: w,
                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${e['image']}"), fit: BoxFit.cover)),
                                  child: Center(
                                    child: Text(
                                      "${e['quote']}",
                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ]),
                            );
                            saveImage(imageBytes);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Download..")));
                          },
                          child: const Icon(
                            Icons.download_rounded,
                            color: Colors.green,
                          ),
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
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (counter < list.length) {
                                  e['bgImage'] = list[counter]['image'];
                                  counter++;
                                }
                              });
                            },
                            child: Icon(
                              Icons.change_circle_rounded,
                              color: Colors.blue,
                            )),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              likeQuote.add(e);
                              print(likeQuote);
                            });
                          },
                          child: const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FlutterClipboard.copy(
                              e['quote'].toString(),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copy")));
                          },
                          child: const Icon(
                            Icons.copy_rounded,
                            color: Colors.blueAccent,
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            final byte = await screenshotController.captureFromWidget(Material(
                              child: Stack(alignment: Alignment.center, children: [
                                Container(
                                  height: h,
                                  width: w,
                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${e['image']}"), fit: BoxFit.cover)),
                                  child: Center(
                                    child: Text(
                                      "${e['quote']}",
                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ]),
                            ));
                            final temp = await getTemporaryDirectory();
                            final path = '${temp.path}/image.jpg';
                            File(path).writeAsBytesSync(byte);
                            await Share.shareFiles([path]);
                          },
                          child: const Icon(
                            Icons.share,
                            color: Colors.red,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Uint8List? imageBytes = await screenshotController.captureFromWidget(
                              Stack(alignment: Alignment.center, children: [
                                Container(
                                  height: h,
                                  width: w,
                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${e['image']}"), fit: BoxFit.cover)),
                                  child: Center(
                                    child: Text(
                                      "${e['quote']}",
                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ]),
                            );
                            saveImage(imageBytes);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Download..")));
                          },
                          child: const Icon(
                            Icons.download_rounded,
                            color: Colors.green,
                          ),
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
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (counter < list.length) {
                                  e['bgImage'] = list[counter]['image'];
                                  counter++;
                                }
                              });
                            },
                            child: Icon(
                              Icons.change_circle_rounded,
                              color: Colors.blue,
                            )),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              likeQuote.add(e);
                              print(likeQuote);
                            });
                          },
                          child: const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FlutterClipboard.copy(
                              e['quote'].toString(),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copy")));
                          },
                          child: const Icon(
                            Icons.copy_rounded,
                            color: Colors.blueAccent,
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            final byte = await screenshotController.captureFromWidget(Material(
                              child: Stack(alignment: Alignment.center, children: [
                                Container(
                                  height: h,
                                  width: w,
                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${e['image']}"), fit: BoxFit.cover)),
                                  child: Center(
                                    child: Text(
                                      "${e['quote']}",
                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ]),
                            ));
                            final temp = await getTemporaryDirectory();
                            final path = '${temp.path}/image.jpg';
                            File(path).writeAsBytesSync(byte);
                            await Share.shareFiles([path]);
                          },
                          child: const Icon(
                            Icons.share,
                            color: Colors.red,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Uint8List? imageBytes = await screenshotController.captureFromWidget(
                              Stack(alignment: Alignment.center, children: [
                                Container(
                                  height: h,
                                  width: w,
                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${e['image']}"), fit: BoxFit.cover)),
                                  child: Center(
                                    child: Text(
                                      "${e['quote']}",
                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ]),
                            );
                            saveImage(imageBytes);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Download..")));
                          },
                          child: const Icon(
                            Icons.download_rounded,
                            color: Colors.green,
                          ),
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
