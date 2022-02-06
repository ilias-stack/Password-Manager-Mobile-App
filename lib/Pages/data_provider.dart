// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class Data {
  static const String f_name = 'data.json';

  static Future<String?> externalLocation() async {
    Directory? dir = await getExternalStorageDirectory();
    return (dir!.path);
  }

  static Write(dynamic val) async {
    final File file = File('${await Data.externalLocation()}/$f_name');
    file.writeAsString(jsonEncode(val));
  }

  static Future ReadFile() async {
    final File file = File('${await Data.externalLocation()}/$f_name');
    return (jsonDecode(await file.readAsString()));
  }
}
