import 'package:film_app/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';

import '../model/movie.dart';

class VerticalListItem extends StatelessWidget {
  final int index;
  VerticalListItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              MovieDetailsScreen.routeName,
              arguments: {
                'id': bestMovieList[index].id,
                'title': bestMovieList[index].title,
                'imageUrl': bestMovieList[index].imageUrl,
                'description': bestMovieList[index].description,
                'rating': bestMovieList[index].rating,
                'year': bestMovieList[index].year,
                'duration': bestMovieList[index].duration,
              },
            );
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: bestMovieList[index].id,
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          bestMovieList[index].imageUrl,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          bestMovieList[index].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.timer_outlined),
                            Text(
                              bestMovieList[index].duration,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Icon(Icons.star_border_outlined),
                            Text(
                              bestMovieList[index].rating,
                            ),
                          ],
                        ),
                        Container(
                          width: 240,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
