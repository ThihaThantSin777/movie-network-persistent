import 'package:flutter/material.dart';
import 'package:netowrk_persistent/constant/hive_constant.dart';
import 'package:netowrk_persistent/data/vos/movie_vo.dart';
import 'package:netowrk_persistent/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MovieVOAdapter());

  await Hive.openBox<MovieVO>(kBoxNameForMovieVO);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
