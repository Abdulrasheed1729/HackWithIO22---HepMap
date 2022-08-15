import 'package:hack_with_io/app/app.dart';
import 'package:hive/hive.dart';

class UserStorageApi implements StorageService {
  static const String _boxName = 'user_record';
  late Box _hiveBox;

  Future<void> openBox([String boxName = _boxName]) async {
    _hiveBox = await Hive.openBox(boxName);
  }

  @override
  Future<void> init() async {
    await openBox();
  }

  @override
  Future<void> set(String? key, data) async {
    _hiveBox.put(key, data);
  }

  @override
  dynamic get(String key) {
    return _hiveBox.get(key);
  }

  @override
  Future<void> delete(String key) async {
    _hiveBox.delete(key);
  }

  @override
  Future<void> clear() async {
    await _hiveBox.clear();
  }

  @override
  Future<void> close() async {
    await _hiveBox.close();
  }
}
