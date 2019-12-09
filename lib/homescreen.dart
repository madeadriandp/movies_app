import 'package:flutter/material.dart';

import 'package:movie_db/pagesss.dart';
import 'package:movie_db/tembakapi.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TembakApi> populer;
  List<TembakApi> nowplaying;
  List<TembakApi> toprated;
  List<TembakApi> upcoming;

  bool loading = true;

  void getMovie() async {
    var response1 = await TembakApi.getPopular();
    var response2 = await TembakApi.getNowPlaying();
    var response3 = await TembakApi.getTopRated();
    var response4 = await TembakApi.getUpcoming();
    // print(response1);
    setState(() {
      populer = response1;
      nowplaying =response2;
      toprated=response3;
      upcoming=response4;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "MOVIES",
            // movie[index].title,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: 
        ListView(children: <Widget>[

        Column(
          children: <Widget>[
            Container(
                height: 87,
                width: 500,
                child: TextFormField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search movies",
                ))),
        
                Text("POPULAR"),
                

                Container(
                   width: MediaQuery.of(context).size.width*0.94,
                   height: MediaQuery.of(context).size.height*4.3/12,
                   child: (

                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: populer.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                       onTap:() {
                        Navigator.pushNamed(context, Pages.Detail, arguments: {"detailscreen": populer[index]});
                      },
                      child: Box(name: populer[index].title,
                                 number: populer[index].voteavg,
                                 url: ("https://image.tmdb.org/t/p/w500/${populer[index].posterpath}"),
                      ),
                    );
                  },
                )
                   ),
                   ),

                   Text("NOW PLAYING"),

                    Container(
                   width: MediaQuery.of(context).size.width*0.94,
                   height: MediaQuery.of(context).size.height*4.3/12,
                   child: (

                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: nowplaying.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap:() {
                        Navigator.pushNamed(context, Pages.Detail, arguments: {"detailscreen": nowplaying[index]});
                      },
                      child: Box(name: nowplaying[index].title,
                                 number: nowplaying[index].voteavg,
                                 url: ("https://image.tmdb.org/t/p/w500/${nowplaying[index].posterpath}"),
                      ),
                    );
                  },
                )
                   ),
                   ),

                   Text("TOP RATED"),

                   Container(
                   width: MediaQuery.of(context).size.width*0.94,
                   height: MediaQuery.of(context).size.height*4.3/12,
                   child: (

                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                       onTap:() {
                        Navigator.pushNamed(context, Pages.Detail, arguments: {"detailscreen": toprated[index]});
                      },
                      child: Box(name: toprated[index].title,
                                 number: toprated[index].voteavg,
                                 url: ("https://image.tmdb.org/t/p/w500/${toprated[index].posterpath}"),
                      ),
                    );
                  },
                )
                   ),
                   ),

                   Text("UPCOMING"),
                   Container(
                   width: MediaQuery.of(context).size.width*0.94,
                   height: MediaQuery.of(context).size.height*4.3/12,
                   child: (

                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcoming.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                       onTap:() {
                        Navigator.pushNamed(context, Pages.Detail, arguments: {"detailscreen": upcoming[index]});
                      },
                      child: Box(name: upcoming[index].title,
                                 number: upcoming[index].voteavg,
                                 url: ("https://image.tmdb.org/t/p/w500/${upcoming[index].posterpath}"),
                      ),
                    );
                  },
                )
                   ),
                   ),
         
          ])

        ],)

    );}

}
       

class Box extends StatelessWidget {
  final String name;
  final num number;
  final Color color;
  final String url;
  const Box(
      {Key key,
      @required this.name,
      @required this.number,
      this.color,
      @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    //add gesture detector
    
    Container(
      width: 140,
      height: 220,
      child: (

        
        Card( 
          child: (Column(
            children: <Widget>[
              Container(
                width:  130,//MediaQuery.of(context).size.width,
                height: 160,//MediaQuery.of(context).size.height*0.2,
                child: (
                  Image(image: NetworkImage(url), fit: BoxFit.fill)

                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                     width: 90,//MediaQuery.of(context).size.width*0.6,
                    child: (
                      Text(name, style: TextStyle(color: Colors.black, fontSize: 10),)
                    ),
                  ),
                  // Spacer(flex: 1,),
                  Container(
                    color: Colors.pink,
                    width: 30,//MediaQuery.of(context).size.width*0.5,
                    // color: Colors.blue[850],
                    child: (
                      Text(number.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 8, color: Colors.white,fontWeight: FontWeight.bold),)

                    ),
                  )
                ],
              )
            ],
          )),
        
      )),

    );}
}       