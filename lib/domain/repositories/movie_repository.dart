import 'package:dio/dio.dart';
import 'package:movie_recommendation_app/domain/models/movie_response_model.dart';

class MovieRepository {
  static String movieUrl = 'https://api.reelgood.com/v3.0/content/random';
  final Dio _dio = Dio();

  Future<MovieResponseModel> getMovie(int genre, int minImdb) async {
    var params = {
      'availability': 'onAnySource',
      'content_kind': 'movie',
      'genre': genre,
      'minumum_imdb': minImdb,
      'sources': 'netflix',
      'region': 'us',
      'nocache': true,
    };

    try {
      Response response = await _dio.get(movieUrl, queryParameters: params);

      return MovieResponseModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('stacktrace: $stacktrace');
      return MovieResponseModel.withError('$error');
    }
  }
}
