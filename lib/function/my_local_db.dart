import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_info_model.dart';

class LocalDB {
  String boxName = 'localDB';

  Future<Box> openBox() async {
    return await Hive.openBox<UserInfoData>(boxName);
  }

  Future<void> saveUserInfo(UserInfoData userInfo) async {
    final box = await openBox();
    await box.put('userInfo', userInfo);
  }

  Future<UserInfoData> getUserInfo(Box box) async {
    final box = await openBox();
    return box.get('userInfo');
  }

  Future<void> updateUser(UserInfoData userInfo) async {
    final box = await openBox();
    await box.put('userInfo', userInfo);
  }

  Future<void> deleteUserInfo() async {
    final box = await openBox();
    await box.delete('userInfo');
  }
}
