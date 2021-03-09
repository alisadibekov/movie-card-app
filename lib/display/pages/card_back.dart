import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_recommendation_app/domain/bloc/movie/movie_bloc.dart';
import 'package:movie_recommendation_app/domain/models/movie_model.dart';
import 'package:movie_recommendation_app/domain/models/movie_response_model.dart';
import 'package:movie_recommendation_app/display/guidelines/colors.dart'
    as Guidelines;

class CardBack extends StatefulWidget {
  @override
  _CardBackState createState() => _CardBackState();
}

class _CardBackState extends State<CardBack> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponseModel>(
      stream: movieBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieResponseModel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return Center(
              child: Text(snapshot.data.error),
            );
          }
          return _buildMovieWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.grey[400]),
          );
        }
      },
    );
  }

  Widget _buildMovieWidget(MovieResponseModel data) {
    MovieModel movie = data.movie;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: Colors.grey[400],
            image: DecorationImage(
                image: NetworkImage(
                  'https://img.reelgood.com/content/movie/' +
                      movie.id +
                      '/poster-780.webp',
                ),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0)
              ],
              stops: [
                0.0,
                0.5,
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.black45),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.imdb,
                  color: Guidelines.Colors.imdbColor,
                  size: 30.0,
                ),
                SizedBox(
                  width: 3.0,
                ),
                Text(
                  movie.imdbRate.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 50.0,
          left: 10.0,
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  movie.overview,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          EvaIcons.clockOutline,
                          color: Colors.white,
                          size: 15.0,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          movie.duration.toString() + 'min',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          EvaIcons.calendarOutline,
                          color: Colors.white,
                          size: 15.0,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          movie.realeaseDate.substring(0, 10),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
