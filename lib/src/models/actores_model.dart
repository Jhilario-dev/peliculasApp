class Cast {

  List<Actor> actores = [];

  Cast();

  Cast.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final actor = new Actor.fromJsonMap(item);
      actores.add( actor );
    }

  }

}
class Actor {
  bool adult;
  int gender;
  int id;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.job,
  });

  Actor.fromJsonMap(Map<String, dynamic> json){
    adult = json['adult'];
    gender= json['gender'];
    id= json['id'];
    name= json['name'];
    originalName= json['original_name'];
    popularity= json['popularity'];
    profilePath= json['profile_path'];
    castId= json['cast_id'];
    character= json['character'];
    creditId= json['credit_id'];
    order= json['order'];
    job= json['job'];
  }

  getImg(){

  if (profilePath == null) {
    return 'https://ceslava.s3-accelerate.amazonaws.com/2016/04/mistery-man-gravatar-wordpress-avatar-persona-misteriosa-510x510.png';
  }else{
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
}