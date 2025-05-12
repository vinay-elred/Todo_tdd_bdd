import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  Future<bool?> show(String msg) async {
    await cancel();
    return await Fluttertoast.showToast(msg: msg);
  }

  Future<bool?> cancel() async {
    return await Fluttertoast.cancel();
  }
}
