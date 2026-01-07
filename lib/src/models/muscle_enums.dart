/// Un solo enum para grupos e individuales
/// El sistema detecta automáticamente si es grupo o músculo individual
enum M {
  // === GRUPOS (seleccionan todos los músculos del grupo) ===
  chest,
  shoulders,
  obliques,
  abs,
  abductor,
  biceps,
  calves,
  forearm,
  glutes,
  hamstrings,
  lats,
  upperBack,
  quads,
  trapezius,
  triceps,
  adductors,
  lowerBack,
  neck,

  // === INDIVIDUALES ===

  // Chest (frontal)
  chest1,    // izquierdo
  chest2,    // derecho

  // Shoulders (frontal: 1-2, trasero: 3-4)
  shoulder1, // frontal izquierdo
  shoulder2, // frontal derecho
  shoulder3, // trasero derecho
  shoulder4, // trasero izquierdo

  // Obliques (frontal)
  obliques1, // derecho
  obliques2, // izquierdo

  // Abs (frontal, de arriba a abajo, alternando lados)
  abs1,      // superior izquierdo
  abs2,      // superior derecho
  abs3,      // medio-alto derecho
  abs4,      // medio-alto izquierdo
  abs5,      // medio-bajo derecho
  abs6,      // medio-bajo izquierdo
  abs7,      // inferior derecho
  abs8,      // inferior izquierdo

  // Abductor (frontal, exterior muslo)
  abductor1, // derecho
  abductor2, // izquierdo

  // Biceps (frontal)
  biceps1,   // derecho
  biceps2,   // izquierdo

  // Calves (1-2 trasero, 3-4 trasero exterior)
  calves1,   // trasero derecho
  calves2,   // trasero derecho exterior
  calves3,   // trasero izquierdo
  calves4,   // trasero izquierdo exterior

  // Forearm (1-2 frontal, 3-4 trasero)
  forearm1,  // frontal derecho
  forearm2,  // frontal izquierdo
  forearm3,  // trasero derecho
  forearm4,  // trasero izquierdo

  // Glutes (trasero)
  glutes1,   // derecho
  glutes2,   // izquierdo

  // Hamstrings (trasero)
  hamstrings1, // derecho
  hamstrings2, // izquierdo

  // Lats (trasero)
  lats1,     // izquierdo
  lats2,     // derecho

  // Upper back (trasero)
  upperBack1, // izquierdo
  upperBack2, // derecho

  // Quads (frontal)
  quads1,    // derecho interior
  quads2,    // izquierdo interior
  quads3,    // derecho exterior
  quads4,    // izquierdo exterior

  // Trapezius (trasero: 1 centro, 2-3 superior, 4-5 frontal)
  trapezius1, // trasero centro
  trapezius2, // trasero superior izquierdo
  trapezius3, // trasero superior derecho
  trapezius4, // frontal izquierdo
  trapezius5, // frontal derecho

  // Triceps (trasero)
  triceps1,  // derecho
  triceps2,  // izquierdo

  // Adductors (frontal, interior muslo)
  adductors1, // derecho
  adductors2; // izquierdo

  /// Convierte el enum al ID usado internamente
  String get id {
    switch (this) {
      case M.upperBack:
        return 'upper_back';
      case M.upperBack1:
        return 'upper_back1';
      case M.upperBack2:
        return 'upper_back2';
      case M.lowerBack:
        return 'lower_back';
      case M.hamstrings:
        return 'harmstrings';
      case M.hamstrings1:
        return 'harmstrings1';
      case M.hamstrings2:
        return 'harmstrings2';
      default:
        return name;
    }
  }
}

/// Extensión para convertir lista de enums a lista de IDs
extension MuscleListExtension on List<M> {
  List<String> toIds() => map((m) => m.id).toList();
}
