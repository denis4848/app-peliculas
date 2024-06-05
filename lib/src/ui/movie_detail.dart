import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final posterURL;
  final description;
  final releaseData;
  final String title;
  final String voteAvarage;
  final int movieId;

  const MovieDetail(
      {super.key,
      this.posterURL,
      this.description,
      this.releaseData,
      required this.title,
      required this.voteAvarage,
      required this.movieId});

  @override
  State<MovieDetail> createState() => _MovieDetailState(
        posterURL: posterURL,
        description: description,
        title: title,
        movieId: movieId,
        releaseData: releaseData,
        voteAvarage: voteAvarage,
      );
}

class _MovieDetailState extends State<MovieDetail> {
  final posterURL;
  final description;
  final releaseData;
  final String title;
  final String voteAvarage;
  final int movieId;

  _MovieDetailState(
      {this.posterURL,
      this.description,
      this.releaseData,
      required this.title,
      required this.voteAvarage,
      required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                elevation: 0.0,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://image.tmdb.org/t/p/w500${posterURL}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 10.0, left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 10.0, left: 10.0),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(
                      voteAvarage,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Padding(padding: EdgeInsets.only(right: 200.0)),
                    Text(
                      releaseData,
                      style: TextStyle(
                          fontSize: 18.0, fontStyle: FontStyle.italic),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
