
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:learn_shared_pref/services/storage_service.dart';

String? token;

Future<void> setup()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  token = await StorageService.loadData(key: StorageKey.token);
}