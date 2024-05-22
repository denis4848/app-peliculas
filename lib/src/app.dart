import 'package:flutter/material.dart';
import 'package:movies_app/src/ui/movie_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Peliculas"),),
        body: MovieList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.movie),

        ),
      ),
    );
  }
}
