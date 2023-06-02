import '../../data/vos/movie_vo.dart';

abstract class MovieDAO {
  void save(List<MovieVO> movieList);

  List<MovieVO>? getMovieListFromDataBase();
}
