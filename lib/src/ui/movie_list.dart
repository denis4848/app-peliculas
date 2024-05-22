import 'dart:js';
import 'movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_item.dart';

import '../resources/movie_api_provider.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late MovieApiProvider api;

  @override
  void initState() {
    super.initState();
    api = new MovieApiProvider();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieItem>(
        future: api.getMovieList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildMovieGrid(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildMovieGrid(AsyncSnapshot<MovieItem> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data?.results?.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkResponse(
                enableFeedback: true,
                child: Image.network(
                  "https://image.tmdb.org/t/p/w185${snapshot.data!.results?[index].posterPath}",
                  fit: BoxFit.cover,
                ),
                onTap: () => openDetailPelicula(snapshot.data, index),
              ),
            ),
          );
        });
  }

  openDetailPelicula(MovieItem? data, int index) {
    /*Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MovieDetail(
            posterURL: data!.results?[index].backdropPath,
            description: data!.results?[index].overview,
            releaseData: data!.results?[index].releaseDate,
            title: data!.results![index].title.toString(),
            voteAvarage: data!.results![index].voteAverage.toString(),
            movieId: data!.results![index].id!.toInt());
    }));*/
  }
}
