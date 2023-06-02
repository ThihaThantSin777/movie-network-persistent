import 'package:hive/hive.dart';
import 'package:netowrk_persistent/constant/hive_constant.dart';
import 'package:netowrk_persistent/data/vos/movie_vo.dart';
import 'package:netowrk_persistent/persistent/movie_dao/movie_dao.dart';

class MovieDAOImpl extends MovieDAO {
  MovieDAOImpl._();

  static final MovieDAOImpl _singleton = MovieDAOImpl._();

  factory MovieDAOImpl() => _singleton;

  @override
  List<MovieVO>? getMovieListFromDataBase() => _movieBox().values.toList();

  @override
  void save(List<MovieVO> movieList) {
    for (MovieVO movieVO in movieList) {
      _movieBox().put(movieVO.id, movieVO);
    }
  }

  Box<MovieVO> _movieBox() => Hive.box<MovieVO>(kBoxNameForMovieVO);
}
