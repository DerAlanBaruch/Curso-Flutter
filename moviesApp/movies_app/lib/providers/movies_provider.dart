
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/now_playing_response.dart';

import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '1729912d58870a1615b8ebd2d399fce9';
  final String _language = 'es_ES';
  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('Movies Provider initialized.');
    getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results[2].title);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}
