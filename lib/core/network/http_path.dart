class HttpPath{
  static const baseUrl = 'https://api.themoviedb.org/3/movie';
  static const getNowPlaying = '$baseUrl/now_playing';
  static const getPopular = '$baseUrl/popular';
  static const baseUrlImages = 'https://image.tmdb.org/t/p/original';
  static getMovieDetail(int idMovie) => '$baseUrl/$idMovie';

}