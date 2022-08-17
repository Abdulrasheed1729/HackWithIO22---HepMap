import 'package:hive/hive.dart';

import '../../models/user.dart';

class UserLocalStorageApi {
  static const String boxName = 'user_record';

  Future<Box> openBox() async {
    Box box = await Hive.openBox<User>(boxName);
    return box;
  }

  Future<void> updateUser(Box box, User user) async {
    await box.put(user.id, user);
  }

  Future<void> deleteUser(Box box, User user) async {
    await box.delete(user.id);
  }
}
