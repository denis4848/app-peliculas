import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_item.dart';

class MovieApiProvider{
  final _apiKey = "1d3b171fa68cc47f1664ca33caaf034d";
  final _baseUrl = "https://api.themoviedb.org/3";

  Future<MovieItem> getMovieList() async{
    final urlPopularMovies = "${_baseUrl}/movie/popular?api_key=${_apiKey}";
    Uri uri = Uri.parse(urlPopularMovies);
    final response = await http.get(uri);

    if(response.statusCode == 200) {
      return MovieItem.fromJson(json.decode(response.body));
    } else {
      throw Exception("Fallo al obtener el listado de peliculas");
    }
  }
}