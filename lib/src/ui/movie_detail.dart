import 'dart:core';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/src/models/trailer_item.dart';
import 'package:movies_app/src/resources/movie_api_provider.dart';

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
  late MovieApiProvider api;

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
    api = new MovieApiProvider();
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
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, right: 10.0, left: 10.0),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(
                      voteAvarage,
                      style: TextStyle(fontSize: 18.0, color: Colors.amber),
                    ),
                    Padding(padding: EdgeInsets.only(right: 200.0)),
                    Text(
                      releaseData,
                      style: TextStyle(
                          fontSize: 18.0, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                Padding(
                    padding:
                        EdgeInsets.only(top: 18.0, right: 10.0, left: 10.0)),
                Text(
                  description,
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(top: 18.0, right: 10.0, left: 10.0)),
                Center(
                  child: Text(
                    "Trailers",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FutureBuilder<TrailerItem>(
                    future: api.getVideos(movieId),
                    builder: (context, trailerSnapshot) {
                      if (trailerSnapshot.hasData) {
                        if (trailerSnapshot.data?.results != null) {
                          return trailerLayout(trailerSnapshot.data);
                        } else {
                          return noTrailer(trailerSnapshot.data);
                        }
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget noTrailer(TrailerItem? data) {
    return Center(
      child: Text("No hay trailers"),
    );
  }

  Widget trailerLayout(TrailerItem? data) {
    return Center(child: trailerItemLayout(data, 0));
  }

  trailerItemLayout(TrailerItem? data, int i) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5.0),
          height: 100.0,
          color: Colors.grey,
          child: Center(
            child: IconButton(
                onPressed: () {
                  _verVideo(data!.results![i].key, data.results![i].site);
                },
                icon: Icon(Icons.play_circle_filled)),
          ),
        ),
        Text(
          data!.results![i].name.toString(),
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}

Future<void> _verVideo(String? key, String? site) async {
  String videoBaseUrl;
  if (site == "YouTube") {
    videoBaseUrl = "https://www.youtube.com/watch?v=${key}";
  } else {
    videoBaseUrl = "www.vimeo.com/${key}";
  }
    String url = "https://www.youtube.com/watch?v=${key}";
    await launch(videoBaseUrl);
  }
