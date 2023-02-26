// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// Future<void> copyDatabase() async {
// // Get the directory for storing the database file
//   Directory documentsDirectory = await getApplicationDocumentsDirectory();
//   String path = join(documentsDirectory.path, 'database.db');
//
// // Check if the database file already exists
//   bool fileExists = await databaseExists(path);
//
//   if (!fileExists) {
// // If the file doesn't exist, copy it from the assets folder
//     ByteData data = await rootBundle.load(join('lib/dbHelper/dbHelper.dart'));
//     List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//     await File(path).writeAsBytes(bytes);
//   }
// }
