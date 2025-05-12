import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToastHelper {
  Future<bool?> show(String msg) async {
    await cancel();
    return await Fluttertoast.showToast(msg: msg);
  }

  Future<bool?> cancel() async {
    return await Fluttertoast.cancel();
  }
}
