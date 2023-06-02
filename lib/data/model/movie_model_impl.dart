import 'package:netowrk_persistent/data/vos/movie_vo.dart';
import 'package:netowrk_persistent/network/data_agent/movie_data_agent.dart';
import 'package:netowrk_persistent/network/data_agent/movie_data_agent_impl.dart';
import 'package:netowrk_persistent/persistent/movie_dao/movie_dao.dart';
import 'package:netowrk_persistent/persistent/movie_dao/movie_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import 'movie_model.dart';

class MovieModelImpl extends MovieModel {
  MovieModelImpl._();

  static final MovieModelImpl _singleton = MovieModelImpl._();

  factory MovieModelImpl() => _singleton;

  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();
  final MovieDAO _movieDAO = MovieDAOImpl();

  @override
  Future<List<MovieVO>?> getNowPlayingMovieList() =>
      _movieDataAgent.getNowPlayingMovieList().then((value) {
        if (value != null) {
          _movieDAO.save(value);
        }
        return value;
      });

  @override
  Stream<List<MovieVO>?> getMovieListFromDataBase() => _movieDAO
      .watchMovieBox()
      .startWith(_movieDAO.getMovieListFromDataBaseStream())
      .map((event) => _movieDAO.getMovieListFromDataBase());
}
