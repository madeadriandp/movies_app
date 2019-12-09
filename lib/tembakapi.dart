import 'package:dio/dio.dart';

class TembakApi {
  // final String name;
  // final String address;
  // bool favorite=false;
  // final int id1;
  // final String imagepath;

  final num popularity; // "popularity": 304.753,
  final num vote; //     "vote_count": 687,
  bool video; //     "video": false,
  final String
      posterpath; //     "poster_path": "/qdfARIhgpgZOBh3vfNhWS4hmSo3.jpg",
  final num id; //     "id": 330457,
  bool adult; //     "adult": false,
  final String
      backdrop; //     "backdrop_path": "/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg",
  final String language; //     "original_language": "en",
  final String orititle; //     "original_title": "Frozen II",
  final List<dynamic> genreid; //     "genre_ids": [
  //       16,
  //       10402,
  //       10751
  //     ],
  final String title; //     "title": "Frozen II",
  final num voteavg; //     "vote_average": 7,
  final String
      overview; //     "overview": "Elsa, Anna, Kristoff and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.",
  final releasedate; //     "release_date": "2019-11-20"

  // Todo(this.title, this.description);

  TembakApi(
      this.popularity,
      this.vote,
      this.video,
      this.posterpath,
      this.id,
      this.adult,
      this.backdrop,
      this.language,
      this.orititle,
      this.genreid,
      this.title,
      this.overview,
      this.voteavg,
      this.releasedate);

  TembakApi.fromJson(Map<String, dynamic> response)
      : popularity = response['popularity'],
        vote = response['vote_count'],
        video = response['video'],
        posterpath = response['poster_path'],
        id = response['id'],
        adult = response['adult'],
        genreid =response ['genre_ids'],
        backdrop = response['backdrop_path'],
        language = response['original_language'],
        orititle = response['original_title'],
        title = response['title'],
        voteavg = response['vote_average'],
        overview = response['overview'],
        releasedate = response['release_date'];


  static getPopular() async {
    
      var response1 = await Dio().get(
          "https://api.themoviedb.org/3/movie/popular?api_key=031d552115e70a64acab51b8f6b9d9d3");

      // var ambil =(response.data['total_results']);
      print(response1);
      List<TembakApi> movie = (response1.data['results'] as List).map((item) {
        print(item);
        return TembakApi.fromJson(item);
      }).toList();
      return movie;
    } 

     static getNowPlaying() async {
    
      var response2 = await Dio().get(
          "https://api.themoviedb.org/3/movie/now_playing?page=1&language=en-US&api_key=031d552115e70a64acab51b8f6b9d9d3");

       print(response2);
      List<TembakApi> movie = (response2.data['results'] as List).map((item) {
        print(item);
        return TembakApi.fromJson(item);
      }).toList();
      return movie;
    } 

    static getTopRated() async {
    
      var response3 = await Dio().get(
          "https://api.themoviedb.org/3/movie/top_rated?api_key=031d552115e70a64acab51b8f6b9d9d3&language=en-US&page=1");

       print(response3);
      List<TembakApi> movie = (response3.data['results'] as List).map((item) {
        print(item);
        return TembakApi.fromJson(item);
      }).toList();
      return movie;
    } 

    static getUpcoming() async {
    
      var response4 = await Dio().get(
          "https://api.themoviedb.org/3/movie/upcoming?api_key=031d552115e70a64acab51b8f6b9d9d3&language=en-US&page=1");

       print(response4);
      List<TembakApi> movie = (response4.data['results'] as List).map((item) {
        print(item);
        return TembakApi.fromJson(item);
      }).toList();
      return movie;
    } 




  }


