import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quote_app/screen/HomePage.dart';
import 'package:quote_app/screen/category.dart';
import 'package:quote_app/screen/like.dart';
import 'package:quote_app/screen/picQuote.dart';
import 'package:quote_app/utils/global.dart';
import 'package:sqflite/sqflite.dart';

Future<void> copyDatabase() async {
// Get the directory for storing the database file
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'database.db');

// Check if the database file already exists
  bool fileExists = await databaseExists(path);

  if (!fileExists) {
// If the file doesn't exist, copy it from the assets folder
    ByteData data = await rootBundle.load(join('assets/database/Quote.db'));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await copyDatabase();
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'database.db');
  Database database = await openDatabase(path);

  list = await database.rawQuery('SELECT * FROM Quote');
  list.toList().toSet();
  runApp(
    MaterialApp(
      //home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:  const TextTheme(
          bodyText2: TextStyle(
            fontFamily: "lobster",
          ),
          bodyText1: TextStyle(
            fontFamily: "lobster",
          ),
        ),
      ),
      routes: {
        '/': (context) => const HomePage(),
        'PicQuote': (context) => const PicQuote(),
        'Category': (context) => const Category(),
        'Like':(context) => const Like(),
      },
    ),
  );
}
