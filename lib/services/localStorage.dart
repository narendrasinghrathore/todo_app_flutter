import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class LocalStorage {
  LocalStorage(this.fileName);

  String fileName;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<File> writeData(String data) async{
    final file = await _localFile;
    // Write the data to file
    return file..writeAsString(data);
  }

  Future<String> get getData async {
    return '';
  }


}
