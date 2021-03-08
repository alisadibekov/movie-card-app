import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/domain/models/movie_response_model.dart';
import 'package:movie_recommendation_app/domain/repositories/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<MovieResponseModel> _subject =
      BehaviorSubject<MovieResponseModel>();

  getMovie(int genre, int minImdb) async {
    MovieResponseModel responseModel =
        await _movieRepository.getMovie(genre, minImdb);
    _subject.sink.add(responseModel);
  }

  void drainStream() {
    _subject.drain();
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponseModel> get subject => _subject;
}

final movieBloc = MovieBloc();
