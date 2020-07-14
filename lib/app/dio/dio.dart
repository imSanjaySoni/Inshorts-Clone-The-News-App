import 'package:dio/dio.dart';
import 'package:inshort_clone/global/global.dart';

class GetDio {
  bool loggedIn;
  GetDio._();

  static Dio getDio() {
    Dio dio = new Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          options.connectTimeout = 90000;
          options.receiveTimeout = 90000;
          options.sendTimeout = 90000;
          options.followRedirects = true;
          options.baseUrl = "http://newsapi.org/v2/";
          options.headers["X-Api-Key"] = "${Global.apikey}";

          return options;
        },
        onResponse: (Response response) async {
          return response;
        },
        onError: (DioError dioError) async {
          if (dioError.type == DioErrorType.DEFAULT) {
            if (dioError.message.contains('SocketException')) {
              print("no internet");
            }
          }

          return dioError.response; //continue
        },
      ),
    );
    return dio;
  }
}
