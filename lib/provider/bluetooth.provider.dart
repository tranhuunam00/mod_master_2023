import 'package:flutter/cupertino.dart';

import '../../models/bleModel.dart';
import 'Stream/user_stream.dart';

class BluetoothProvider with ChangeNotifier {
  MyStream myStream = new MyStream();
  BluetoothModel BleP = BluetoothModel(bluetoothDevice: null);

  Future setBle(BluetoothModel bleDivice) async {
    try {
      BleP = bleDivice;
      myStream.setBle(bleDivice);
    } catch (e) {}
    notifyListeners();
  }

  Future clearBle() async {
    try {
      BleP = BluetoothModel(bluetoothDevice: null);
      myStream.clearBle();
    } catch (e) {}
    notifyListeners();
  }
}
