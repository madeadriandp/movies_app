import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/tembakapi.dart';

class DetailScreen extends StatelessWidget {
  final TembakApi film;
  const DetailScreen(
      {Key key,
      @required this.film,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
    
    Column(children: <Widget>[
      Container(
        child: (

        Image(image: NetworkImage("https://image.tmdb.org/t/p/w500/${film.backdrop}"))

        ),
      ),
      Container(
        width: 350,
        height: 387,
        child: (
      Card(child: (Column(
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              width: 120,
              height: 240,
              child: (
                Image(image: NetworkImage("https://image.tmdb.org/t/p/w500/${film.posterpath}"),)
              ),
            ),

            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(width:15),
            Container(
              // color: Colors.blueAccent,
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle
              ),
              child: (
                Text("${film.voteavg}",style: TextStyle(color: Colors.white,fontSize: 24),)
              ),
            ),
            SizedBox(width: 20),
            Column(children: <Widget>[
              Icon(Icons.star),
              Text("${film.popularity}")

              ],),

            ],),
            SizedBox(height: 30),
            SizedBox(width: 15),

            Text("${film.title}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue,)
            ),
          SizedBox(height: 100,)

            
            ],),

          ],),
          Text("${film.overview}"),
          SizedBox(height: 10,),// Spacer(),
          Container(
            alignment: Alignment.centerLeft,
            child: (
          Text("CAST", textAlign: TextAlign.left,
          style: TextStyle(color: Colors.blueGrey, fontSize: 14),)

            ),
          )

        ],
      ))
      
      ,)


        ),
      ),
      ]);}}


      // FittedBox(
      //   fit: BoxFit.fill,
      //   alignment: Alignment.center,
      //   child: (
      //     Image(image: NetworkImage("https://image.tmdb.org/t/p/w500/zBhv8rsLOfpFW2M5b6wW78Uoojs.jpg"))
      //   ),
      // )

//      ),
//      Column(children: <Widget>[
//         Row(children: <Widget>[
//           FittedBox(  
//           fit: BoxFit.fill,
//            alignment: Alignment.centerLeft,
//            child: (
//            Image(image: NetworkImage("https://image.tmdb.org/t/p/w500/zBhv8rsLOfpFW2M5b6wW78Uoojs.jpg"))
//            ),
//           ),
//           Column(
//             children: <Widget>[
//               Row(children: <Widget>[
//                 Text("Test"),
//                 Column(children: <Widget>[
//                   Icon(Icons.star),
//                   Text("test")
//                 ],)
//               ],),
//               Text("test"),
//               Text("Duration")
//             ],
//           )
//         ],),

//         Text("test"),

//         Text("CAST", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, color: Colors.blue),
//         ),

//         ListView(
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Column(children: <Widget>[
//                   Image(image: NetworkImage("https://image.tmdb.org/t/p/w500/zBhv8rsLOfpFW2M5b6wW78Uoojs.jpg"),),
//                   Text("Actor"),                
//                 ],
//                 ),
//                 Column(children: <Widget>[
//                   Image(image: NetworkImage("https://image.tmdb.org/t/p/w500/zBhv8rsLOfpFW2M5b6wW78Uoojs.jpg"),),
//                   Text("Actor"),                
//                 ],
//                 )
//               ],
//             )
//           ],
//         ),

//         Container(child: Text("Buy Movie", style: TextStyle(color: Colors.white),), color: Colors.blue,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(width: 5.0)
//                   ), )        

//      ],)
//     ],
      
//     );
//   }
// }