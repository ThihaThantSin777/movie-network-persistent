import 'package:flutter/material.dart';
import 'package:netowrk_persistent/constant/api_constant.dart';

import '../../data/vos/movie_vo.dart';

class MovieItemView extends StatelessWidget {
  const MovieItemView({Key? key, required this.movieVO}) : super(key: key);
  final MovieVO movieVO;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage:
              NetworkImage('$kImagePrefix${movieVO.posterPath ?? ''}'),
        ),
        title: Text(movieVO.title ?? ''),
        subtitle: Text(movieVO.overview ?? ''),
        isThreeLine: true,
      ),
    );
  }
}
