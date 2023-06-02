import 'package:netowrk_persistent/data/vos/movie_vo.dart';

abstract class MovieModel {
  Future<List<MovieVO>?> getNowPlayingMovieList();

  Stream<List<MovieVO>?> getMovieListFromDataBase();
}
