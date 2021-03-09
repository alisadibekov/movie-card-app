class MovieModel {
  final String id;
  final String slug;
  final String title;
  final String overview;
  final String tagline;
  final String type;
  final int duration;
  final String realeaseDate;
  final double imdbRate;

  MovieModel({
    this.id,
    this.slug,
    this.title,
    this.overview,
    this.tagline,
    this.type,
    this.duration,
    this.realeaseDate,
    this.imdbRate,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        slug = json['slug'],
        title = json['title'],
        overview = json['overview'] == null ? '' : json['overview'],
        tagline = json['tagline'] == null ? '' : json['tagline'],
        type = json['classification'] == null ? '' : json['classification'],
        duration = json['runtime'] == null ? '' : json['runtime'],
        realeaseDate = json['released_on'] == null ? '' : json['released_on'],
        imdbRate = json['imdb_rating'] == null
            ? 0.0
            : double.parse(json['imdb_rating'].toString());
}
