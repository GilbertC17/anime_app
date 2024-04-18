class Anime {
  final String name; // Nombre del anime
  final double score; // Puntuación del anime
  final int number; // Número de episodios del anime
  final String poster; // URL del póster del anime

  const Anime({required this.name, required this.score, required this.number, required this.poster}); // Constructor de la clase Anime
}

// Lista constante de animes populares
const trendsData = const [
  Anime(
    name: 'My Hero Academy' , // Nombre, número de episodios, puntuación y URL del póster del anime
    number: 22,
    score: 9.3,
    poster: 'assets/images/boku-no-hero-academia-memories.jpg',
  ),
  Anime(
    name: 'Boruto: Naruto Next Generation' , // Nombre, número de episodios, puntuación y URL del póster del anime
    number: 12,
    score: 8.2,
    poster: 'assets/images/boruto-naruto-next-generations.jpg',
  ),
  Anime(
    name: 'Spy X Family' , // Nombre, número de episodios, puntuación y URL del póster del anime
    number: 11,
    score: 9.2,
    poster: 'assets/images/spy-x-family.jpg',
  ),
];

// Lista constante de animes recientes
const recentsData = const [
  Anime(
    name: 'Chainsaw Man' , // Nombre, número de episodios, puntuación y URL del póster del anime
    number: 122,
    score: 9.54,
    poster: 'assets/images/chainsaw-man.jpg',
  ),
  Anime(
    name: 'Sono Bisque Doll' , // Nombre, número de episodios, puntuación y URL del póster del anime
    number: 2132,
    score: 8.12,
    poster: 'assets/images/sono-bisque-doll-wa-koi-wo-suru.jpg',
  ),
  Anime(
    name: 'Uzaki Chan Wa Asobitai' , // Nombre, número de episodios, puntuación y URL del póster del anime
    number: 782,
    score: 7.89,
    poster: 'assets/images/uzaki-chan-wa-asobitai.jpg',
  ),
  Anime(
    name: 'Shingeki No Kyojin The Final Season Part 2' , // Nombre, número de episodios, puntuación y URL del póster del anime
    number: 554,
    score: 9.88,
    poster: 'assets/images/shingeki-no-kyojin-the-final-season-part-2.jpg',
  ),
];