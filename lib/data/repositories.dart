import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fieldnxtdemo/data/models/login_model.dart';
import 'package:fieldnxtdemo/data/webclient.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Repository {
  Future<LoginModel> login({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final LoginModel loginModel = LoginModel.fromJson(response);
    return loginModel;
  }
}
