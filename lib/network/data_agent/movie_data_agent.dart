import 'package:netowrk_persistent/data/vos/movie_vo.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?> getNowPlayingMovieList();
}
