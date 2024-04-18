import 'package:anime_ui/anime_ui_for_youtube/pages/home.dart'; // Importa la página de inicio de la aplicación.
import 'package:anime_ui/anime_ui_for_youtube/utils/anime_ui_for_youtube_colors.dart'; // Importa los colores personalizados para la aplicación.
import 'package:flutter/material.dart'; // Importa el paquete Flutter Material.
import 'package:flutter/services.dart'; // Importa el paquete Flutter Services.
import 'package:google_fonts/google_fonts.dart'; // Importa la librería Google Fonts.

void main() => runApp(MyApp()); // Función principal que inicia la aplicación Flutter.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Configura el estilo de la barra de estado
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Color de fondo transparente de la barra de estado.
        statusBarIconBrightness: Brightness.light, // Color de los iconos de la barra de estado (claro).
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la bandera de modo de depuración.
      theme: ThemeData.light().copyWith( // Configura el tema de la aplicación.
        scaffoldBackgroundColor: AnimeUiForYoutubeColors.background, // Color de fondo del Scaffold.
        textTheme: GoogleFonts.sourceCodeProTextTheme(), // Configura los estilos de texto utilizando la fuente de Google Fonts.
      ),
      home: HomePage(), // Página de inicio de la aplicación.
    );
  }
}