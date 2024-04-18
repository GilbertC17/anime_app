class NavBar { // Clase que representa un elemento de la barra de navegación.
  final String path; // Ruta del icono de la barra de navegación.
  final String name; // Nombre del elemento de la barra de navegación.

  const NavBar({required this.path, required this.name}); // Constructor constante que requiere una ruta y un nombre.
}

const itemsNavBar = const [ // Lista constante que contiene elementos de la barra de navegación.
  NavBar(name: 'Home', path: 'assets/icons/home.svg'), // Elemento "Home" con su ruta de icono correspondiente.
  NavBar(name: 'Search', path: 'assets/icons/search.svg'), // Elemento "Search" con su ruta de icono correspondiente.
  NavBar(name: 'Favorites', path: 'assets/icons/favorite.svg'), // Elemento "Favorites" con su ruta de icono correspondiente.
  NavBar(name: 'Profile', path: 'assets/icons/users.svg'), // Elemento "Profile" con su ruta de icono correspondiente.
];