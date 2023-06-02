import 'package:flutter/material.dart';
import 'package:netowrk_persistent/constant/api_constant.dart';
import 'package:netowrk_persistent/data/model/movie_model.dart';
import 'package:netowrk_persistent/data/model/movie_model_impl.dart';

import '../data/vos/movie_vo.dart';
import '../view_items/movie_view_items/home_page_view_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieModel _movieModel = MovieModelImpl();
  List<MovieVO> _getNowPlayingMovieList = [];

  @override
  void initState() {
    ///Fetch NetworkCall and Save to Database
    _movieModel.getNowPlayingMovieList().then((value) {
      final value = _movieModel.getMovieListFromDataBase();
      if (mounted) {
        setState(() {
          _getNowPlayingMovieList = value ?? [];
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text("Discover"),
      ),
      body: _getNowPlayingMovieList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: _getNowPlayingMovieList
                    .map((e) => MovieItemView(movieVO: e))
                    .toList(),
              ),
            ),
    );
  }
}
