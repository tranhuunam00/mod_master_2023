import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mod_master_2023/models/user.model.dart';

class SecureStorage {
  final _storage = new FlutterSecureStorage();

  static const _tokenKey = 'TOKEN';

  static const _isSaveData = 'IS_SAVE_DATA';

  static const _user = 'USER';

  static const _phoneNumber = "phoneNumber";

  Future<void> saveToken({required String token}) async {
    print("Đã lưu token");
    print(token);
    await _storage.write(key: _tokenKey, value: "Bearer " + token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> saveIsSaveData({required String isSaveData}) async {
    await _storage.write(key: _isSaveData, value: isSaveData);
  }

  Future<String?> getIsSaveData() async {
    return await _storage.read(key: _isSaveData);
  }

  Future<void> deleteToken() async {
    return _storage.delete(key: _tokenKey);
  }

  Future<void> deleteAll() async {
    return _storage.deleteAll();
  }

  Future<void> saveCustomer({required ProfileUser user}) async {
    await _storage.write(key: _user, value: user.toString());
  }

  Future<ProfileUser> getUser() async {
    String? userString = await _storage.read(key: _user);

    if (userString != null) {
      ProfileUser user = ProfileUser.fromJson(jsonDecode(userString));

      return user;
    }

    return new ProfileUser(
        id: "",
        firstName: "",
        lastName: "",
        email: "",
        phone: "",
        dob: "",
        gender: "",
        nationality: "",
        customerId: "");
  }

  Future<void> savePhoneNumber({required String phoneNumber}) async {
    await _storage.write(key: _phoneNumber, value: phoneNumber);
  }

  Future<String?> getPhoneNumber() async {
    return await _storage.read(key: _phoneNumber);
  }
}
