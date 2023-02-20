import 'package:dio/dio.dart';

class PhotoEndpoints {
  //Endpoints
  String photosEndpoint = '/photos';

  final Dio _client;

  PhotoEndpoints(this._client);

  Future<Response?> getPhotos(int page) async {
    try {
      final response = _client.get('$photosEndpoint/?page=$page');
      return response;
    } on DioError catch (err) {
      return err.response;
    }
  }
}
