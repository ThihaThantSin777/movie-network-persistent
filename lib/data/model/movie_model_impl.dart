import 'package:netowrk_persistent/data/vos/movie_vo.dart';
import 'package:netowrk_persistent/network/data_agent/movie_data_agent.dart';
import 'package:netowrk_persistent/network/data_agent/movie_data_agent_impl.dart';

import 'movie_model.dart';

class MovieModelImpl extends MovieModel {
  MovieModelImpl._();

  static final MovieModelImpl _singleton = MovieModelImpl._();

  factory MovieModelImpl() => _singleton;

  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();

  @override
  Future<List<MovieVO>?> getNowPlayingMovieList() =>
      _movieDataAgent.getNowPlayingMovieList();
}
