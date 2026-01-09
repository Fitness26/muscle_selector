import 'package:flutter/services.dart' show rootBundle;
import 'package:svg_path_parser/svg_path_parser.dart';
import 'size_controller.dart';
import 'constant.dart';
import 'models/muscle.dart';

class Parser {
  static Parser? _instance;

  static Parser get instance {
    _instance ??= Parser._init();
    return _instance!;
  }

  final sizeController = SizeController.instance;

  Parser._init();

  static const muscleGroups = {
    'chest': ['chest1', 'chest2'],
    'shoulders': ['shoulder1', 'shoulder2', 'shoulder3', 'shoulder4'],
    'obliques': ['obliques1', 'obliques2'],
    'abs': ['abs1', 'abs2', 'abs3', 'abs4', 'abs5', 'abs6', 'abs7', 'abs8'],
    'abductor': ['abductor1', 'abductor2'],
    'biceps': ['biceps1', 'biceps2'],
    'calves': ['calves1', 'calves2', 'calves3', 'calves4'],
    'forearm': ['forearm1', 'forearm2', 'forearm3', 'forearm4'],
    'glutes': ['glutes1', 'glutes2'],
    'harmstrings': ['harmstrings1', 'harmstrings2'],
    'lats': ['lats1', 'lats2'],
    'upper_back':['upper_back1', 'upper_back2'],
    'quads': ['quads1', 'quads2', 'quads3', 'quads4'],
    'trapezius': ['trapezius1', 'trapezius2', 'trapezius3', 'trapezius4', 'trapezius5'],
    'triceps': ['triceps1', 'triceps2'],
    'adductors': ['adductors1', 'adductors2'],
    'lower_back': ['lower_back'],
    'neck': ['neck']
  };

  Set<Muscle> getMusclesByGroups(List<String> groupKeys, List<Muscle> muscleList) {
    final Set<String> muscleIds = {};

    for (final key in groupKeys) {
      if (muscleGroups.containsKey(key)) {
        // Es un grupo, añadir todos sus músculos
        muscleIds.addAll(muscleGroups[key]!);
      } else {
        // Es un ID individual de músculo
        muscleIds.add(key);
      }
    }

    return muscleList.where((muscle) => muscleIds.contains(muscle.id)).toSet();
  }

  Future<List<Muscle>> svgToMuscleList(String body) async {
    final svgMuscle = await rootBundle.loadString('${Constants.ASSETS_PATH}/$body');
    List<Muscle> muscleList = [];

    final regExp = RegExp(Constants.MAP_REGEXP, multiLine: true, caseSensitive: false, dotAll: false);

    regExp.allMatches(svgMuscle).forEach((muscleData) {
      final id = muscleData.group(1)!;
      final title = muscleData.group(2)!;
      final path = parseSvgPath(muscleData.group(3)!);

      sizeController.addBounds(path.getBounds());

      final muscle = Muscle(id: id, title: title, path: path);
      muscleList.add(muscle);
    });

    return muscleList;
  }

}
