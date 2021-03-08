import 'package:movie_recommendation_app/domain/models/movie_model.dart';

class MovieResponseModel {
  final MovieModel movie;
  final String error;

  MovieResponseModel({
    this.movie,
    this.error,
  });

  MovieResponseModel.fromJson(Map<String, dynamic> json)
      : movie = MovieModel.fromJson(json),
        error = '';

  MovieResponseModel.withError(String errorValue)
      : movie = MovieModel(
          id: '',
          slug: '',
          title: '',
          overview: '',
          tagline: '',
          type: '',
          duration: null,
          realeaseDate: '',
          imdbRate: null,
        ),
        error = errorValue;
}
