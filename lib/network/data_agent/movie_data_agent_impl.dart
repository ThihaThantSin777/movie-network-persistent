import 'package:dio/dio.dart';
import 'package:netowrk_persistent/constant/api_constant.dart';
import 'package:netowrk_persistent/data/vos/movie_vo.dart';

import '../api/movie_api.dart';
import 'movie_data_agent.dart';

class MovieDataAgentImpl extends MovieDataAgent {
  late MovieAPI _movieAPI;

  MovieDataAgentImpl._() {
    _movieAPI = MovieAPI(Dio());
  }

  static final MovieDataAgentImpl _singleton = MovieDataAgentImpl._();

  factory MovieDataAgentImpl() => _singleton;

  @override
  Future<List<MovieVO>?> getNowPlayingMovieList() => _movieAPI
      .getNowPlayingMovieResponse(kAPIKey)
      .asStream()
      .map((event) => event.results)
      .first;
}
