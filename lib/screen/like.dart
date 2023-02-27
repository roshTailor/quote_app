import 'package:flutter/material.dart';
import 'package:quote_app/utils/global.dart';

class Like extends StatefulWidget {
  const Like({Key? key}) : super(key: key);

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Liked Quotes",
          style: TextStyle(
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
      body: ListView.builder(
        itemCount: likeQuote.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              height: 440,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.grey)],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Column(
                children: [
                  Container(
                    height: 380,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("${likeQuote[i]['bgImg']}"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.black38),
                    child: Container(
                      height: 440,
                      color: Colors.black.withOpacity(0.45),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Center(
                          child: Text(
                            "${likeQuote[i]['quote']}",
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
