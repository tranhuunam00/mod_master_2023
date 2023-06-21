import 'dart:ffi';
import 'dart:typed_data';

class BleHelper {
  void onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
    String dataString = String.fromCharCodes(buffer);
  }

  static Function getPositionSleep = (double x, double y, double z) {
    if ((-6.5 < y && y < 6.5)) {
      if (-7.07 < x && x < 7.07) {
        if (z > 0) {
          return 1; // ngửa
        }
        if (z < 0) {
          return 4; //sấp
        }
      }
      if (x > 3) return 2; //trái
      if (x < -3) return 3; //phải

    }
    return 6; // không phải nằm
  };
}
