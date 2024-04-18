
import 'package:anime_ui/anime_ui_for_youtube/utils/anime_ui_for_youtube_colors.dart'; // Importa colores personalizados para la aplicación.
import 'package:anime_ui/models/anime.dart'; // Importa el modelo Anime.
import 'package:anime_ui/models/nav_bar.dart'; // Importa el modelo NavBar.
import 'package:flutter/material.dart'; // Importa el paquete Flutter Material.
import 'package:flutter_svg/flutter_svg.dart'; // Importa el paquete Flutter SVG.

void main() {
  runApp(MyApp()); // Inicia la aplicación Flutter.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la bandera de modo de depuración.
      title: 'Anime App', // Título de la aplicación.
      theme: ThemeData.light().copyWith( // Configuración del tema.
        scaffoldBackgroundColor: AnimeUiForYoutubeColors.background, // Color de fondo del Scaffold.
        textTheme: TextTheme( // Estilos de texto.
          headline6: TextStyle(color: AnimeUiForYoutubeColors.cyan), // Color del título principal.
          subtitle1: const TextStyle(color: Colors.white), // Color del subtítulo 1.
        ),
      ),
      home: const HomePage(), // Página de inicio de la aplicación.
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Body(), // Cuerpo de la aplicación.
            NavBar(), // Barra de navegación.
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final _index = ValueNotifier<int>(0); // Índice de la barra de navegación.

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.4,
        decoration: BoxDecoration(
          color: AnimeUiForYoutubeColors.background, // Color de fondo.
          boxShadow: [
            BoxShadow(
              color: AnimeUiForYoutubeColors.cyan.withOpacity(.45), // Sombra de la barra de navegación.
              spreadRadius: 7.5,
              blurRadius: 15,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: List.generate(
            itemsNavBar.length,
            (index) => Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: _index,
                builder: (_, value, __) {
                  return GestureDetector(
                    onTap: () => _index.value = index,
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            itemsNavBar[index].path,
                            width: 25,
                            height: 25,
                            color: (index == value) ? AnimeUiForYoutubeColors.cyan : Colors.grey, // Color del ícono de la barra de navegación.
                          ),
                          const SizedBox(height: 5),
                          Text(
                            itemsNavBar[index].name,
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: (index == value) ? AnimeUiForYoutubeColors.cyan : Colors.white, // Color del texto de la barra de navegación.
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        Header(), // Encabezado de la aplicación.
        Trends(), // Tendencias de la aplicación.
        Recents(), // Animes recientes de la aplicación.
        Aviable(), // Animes disponibles de la aplicación.
        SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight * 1.4)), // Espacio para la barra de navegación.
      ],
    );
  }
}

class Aviable extends StatelessWidget {
  const Aviable({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Disponible: Kimetsu no Yaiba Mugen Ressha Hen', // Título del anime disponible
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white, // Color del texto
                      fontWeight: FontWeight.bold, // Estilo de texto en negrita
                    ),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/kimetsu-no-yaiba-movie-mugen-ressha-hen.jpg', // Imagen del anime disponible
                      fit: BoxFit.cover, // Ajuste de la imagen
                    ),
                  ),
                  Align(
                    child: SvgPicture.asset(
                      'assets/icons/play_awesome.svg', // Icono de reproducción SVG
                      width: 85, // Ancho del icono de reproducción
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListRecents extends StatelessWidget {
  const ListRecents({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return ListView.builder(
            itemCount: recentsData.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, top: 10),
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(recentsData[index].poster, fit: BoxFit.cover), // Carga la imagen del anime reciente
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AspectRatio(
          aspectRatio: 16 / 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recientemente añadidos:', // Título de la sección de animes recientes
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold), // Estilo de texto para el título
                ),
              ),
              const ListRecents(), // Lista de animes recientes
            ],
          ),
        ),
      ),
    );
  }
}

class Trends extends StatelessWidget {
  const Trends({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: AspectRatio(
          aspectRatio: 16 / 12,
          child: Column(
            children: [
              HeaderTrends(), // Encabezado de la sección de tendencias
              ListTrends(), // Lista de tendencias
            ],
          ),
        ),
      ),
    );
  }
}

class ListTrends extends StatelessWidget {
  const ListTrends({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          return ListView.builder(
            itemCount: trendsData.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 10, left: 20),
            itemBuilder: (_, index) {
              final anime = trendsData[index];
              final style = Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600);
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.375,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(anime.poster, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        anime.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 7.5),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/logo_evil.svg', width: 15, height: 15),
                          const SizedBox(width: 5),
                          Text(
                            'Score: ${anime.score}',
                            style: style,
                          ),
                          const SizedBox(height: 7.5),
                          Text(
                            ' #${anime.number}',
                            style: style?.copyWith(color: AnimeUiForYoutubeColors.cyan),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HeaderTrends extends StatelessWidget {
  const HeaderTrends({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Tendencias',
              style: TextStyle(
                fontSize: 26, // Tamaño de fuente deseado
                fontWeight: FontWeight.bold, // Peso de fuente deseado
                color: Colors.white, //Color de fuente
              ),
            ),
          ),
          Text(
            'Explorar',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AnimeUiForYoutubeColors.cyan,
                  fontWeight: FontWeight.w700,
                ),
          )
        ],
      ),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  HeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: HeaderDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
          color: AnimeUiForYoutubeColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'FrunchyTroll',
                      style: TextStyle(
                        fontSize: 16, // Tamaño de fuente
                        fontWeight: FontWeight.bold, // Peso de fuente
                        color: AnimeUiForYoutubeColors.cyan, //Color de fuente
                      ),
                    ),
                  ),
                  const Icon(Icons.search, color: Colors.white, size: 30),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '¿Qué anime te gustaría ver hoy?',
                style: TextStyle(
                  fontSize: 14, // Tamaño de fuente
                  fontWeight: FontWeight.bold, // Peso de fuente
                  color: Colors.white, //Color de fuente
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}