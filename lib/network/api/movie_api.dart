import 'package:dio/dio.dart';
import 'package:netowrk_persistent/constant/api_constant.dart';
import 'package:retrofit/http.dart';

import '../response/movie_response/movie_response.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class MovieAPI {
  factory MovieAPI(Dio dio) => _MovieAPI(dio);

  @GET(kEndPointOfGetNowPlaying)
  Future<MovieResponse> getNowPlayingMovieResponse(
    @Query(kQueryParamsApiKey) String apikey,
  );
}
