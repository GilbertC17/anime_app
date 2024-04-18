import 'package:flutter/material.dart'; // Importa el paquete Flutter Material.

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate { // Define una clase SliverCustomHeaderDelegate que extiende SliverPersistentHeaderDelegate.
  final double minHeight; // Altura mínima del encabezado.
  final double maxHeight; // Altura máxima del encabezado.
  final Widget child; // Widget del encabezado.

  SliverCustomHeaderDelegate({ // Constructor de la clase SliverCustomHeaderDelegate que recibe la altura mínima, altura máxima y widget del encabezado como parámetros.
    required this.minHeight, // Inicializa la altura mínima del encabezado.
    required this.maxHeight, // Inicializa la altura máxima del encabezado.
    required this.child, // Inicializa el widget del encabezado.
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) { // Construye el encabezado.
    return SizedBox.expand(child: child); // Retorna un widget de tamaño expandible con el widget del encabezado.
  }

  @override
  double get maxExtent => maxHeight; // Obtiene la altura máxima del encabezado.

  @override
  double get minExtent => minHeight; // Obtiene la altura mínima del encabezado.

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true; // Determina si el encabezado debe reconstruirse.
}