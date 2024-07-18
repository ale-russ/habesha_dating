import "package:hive_flutter/hive_flutter.dart";

class DbAccess {
  static late Box appBox;

  static Box get userDB => appBox;

  static Future initHive() async =>
      await Hive.initFlutter().then((_) async => initDB());

  static Future<Box> initDB() async => appBox = await Hive.openBox("appBox");

  static String get token => readData("token");

  static dynamic readData(String key, {dynamic defaultValue}) =>
      userDB.get(key, defaultValue: defaultValue) ?? defaultValue;

  static Future writeData(String key, dynamic value) => userDB.put(key, value);

  static Future deleteData(String key) => userDB.delete(key);
}
