import 'package:flutter/material.dart';
import 'package:peliculas/src/Widgets/card_swiper_widget.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[_swipeTarjetas()],
          ),
        ));
  }

  Widget _swipeTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCInes(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

    // peliculasProvider.getEnCInes();
    // return CardSwiper(peliculas: [1,2,3,4,5],);
  }
}
