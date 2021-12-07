import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:whole_snack/core/model/data_model/user_log_model.dart';
class SecureStorageHelper{
  final _storage = FlutterSecureStorage();
  Future writeSecureData({required String key, required String value})  async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }
  Future readSecureData({required String key}) async {
    var readData = await _storage.read(key: key);

    print(readData);
    return readData;
  }
  Future deleteSecureData({required String key}) async{
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }


}