import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider{

  String _apikey = 'ab8e2021bd050f2f5ad331fae1d6ce90';
  String _url= 'api.themoviedb.org' ;
  String _language = 'es-ES';


Future<List<Pelicula>> getEnCInes() async{

  final url = Uri.https(_url, '3/movie/now_playing', {
    'api_key' : _apikey,
    'language' : _language
    
    });

  final resp = await http.get(url);

  final decodedData = json.decode(resp.body);
  
  final peliculas = new Peliculas.fromJsonList(decodedData['results']);


  return peliculas.items;

}



}