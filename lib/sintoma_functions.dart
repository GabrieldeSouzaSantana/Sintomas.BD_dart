import 'package:flutter/material.dart';
import 'package:sintomas_bd/domain/sintomas.dart';

extension SintomaFunctions on Sintoma {
  IconData get iconData => _mapIcon(icone);
  Color get colorData => _mapColor(cor);

  IconData _mapIcon(String iconName) {
    switch (iconName) {
      case 'thumb_up':
        return Icons.thumb_up;
      case 'face':
        return Icons.face;
      case 'local_fire_department':
        return Icons.local_fire_department;
      case 'air':
        return Icons.air;
      case 'bedtime':
        return Icons.bedtime;
      case 'fitness_center':
        return Icons.fitness_center;
      default:
        return Icons.help;
    }
  }

  Color _mapColor(String colorName) {
    switch (colorName) {
      case 'yellow':
        return Colors.yellow;
      case 'orangeAccent':
        return Colors.orangeAccent;
      case 'pink':
        return Colors.pink;
      case 'lightBlue':
        return Colors.lightBlue;
      case 'amber':
        return Colors.amber;
      case 'blueAccent':
        return Colors.blueAccent;
      default:
        return Colors.grey;
    }
  }
}
