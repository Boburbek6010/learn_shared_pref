import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/note_model.dart';

enum LocaleKey{
  noteKey,
}

@immutable
sealed class HiveService {

  static const String dbName = "first_db";

  static Box box = Hive.box(dbName);

  /// save
  Future<void>saveData(List<NoteModel> notes, {required LocaleKey key})async{
    List<String> stringList = notes.map((item) => json.encode(item.toJson())).toList();
    await box.put(key.name, stringList);
  }

  /// load
  Future<List<NoteModel>> loadData({required LocaleKey key})async{
    List<String> stringList = await box.get(key.name) ?? <String>[];
    List<NoteModel> notes = stringList.map((item) => NoteModel.fromJson(jsonDecode(item))).toList();
    return notes;
  }

  /// remove
  Future<void>clearAll({required LocaleKey key})async{
    await box.delete(key.name);
  }

}