import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    //print(moviesProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en Cines'),
        elevation: 0,
        actions: [IconButton(onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(
              title: 'Populares',
              movies: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
            )
          ],
        ),
      ),
    );
  }
}
