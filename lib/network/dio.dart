import 'package:dio/dio.dart';

// const String baseUrl = 'https://aa43-37-157-37-138.eu.ngrok.io/';
const String baseUrl = 'https://7013-82-0-246-2.ngrok.io/';
const String frBaseUrl = 'https://test.florence.co.uk/';
const String ukBaseUrl = 'https://test2.florence.co.uk/';

class DioClient {
  DioClient(String baseUrl) {
    _dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjdiamFXM0RJRFhFT3VZSExWNU9TRyJ9.eyJpc3MiOiJodHRwczovL2xvZ2luLmZsb3JlbmNlLmNvLnVrLyIsInN1YiI6ImF1dGgwfDVmNTIwOTc4NDc2MDdhMDA2NzVmMGRiZiIsImF1ZCI6WyJodHRwczovL3d3dy5mbG9yZW5jZS5jby51ay9hcGkiLCJodHRwczovL2Zsb3JlbmNlLWV1LmV1LmF1dGgwLmNvbS91c2VyaW5mbyJdLCJpYXQiOjE2NjQyMDQxMTksImV4cCI6MTY2NDI5MDUxOSwiYXpwIjoib3hBamtKQUpqalJMYVQxZVh1d3dERmVENmR2eTVENFUiLCJzY29wZSI6Im9wZW5pZCBwcm9maWxlIGVtYWlsIG9mZmxpbmVfYWNjZXNzIn0.oLeAVGhWoZakkTHiVZn8CkWWORP3-5Zdu1HuYSSdLsRbvBh0HFf-Ck2MlFPybm8U8MkVdTtAlnEjVHns2hUATuigWnrqeNIJfK_tIW4BaoZdKBo-BdqRmdtmP_r2eFPjtRK14pt4hIKakXVFfkxk2yTSDAtHzt90J_hRgzO5tmFyNF-at9uj0C8NpUE9ExiYvW6Y4JTbwriYc11yS3aOR3NlTVtN759iIKAch7nvRgggTWPXNypVUdgf91bHD3iGbTWAotew0N9KKMKTGpASlBpXJZ3W-GxZmVsKA5EkdtZKdkzCdKnztAs7mP5CrvACoju9ZvkrbMjaFRWnAgPxnw',
    };
    _dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  late Dio _dio;

  Dio get dio => _dio;
}
