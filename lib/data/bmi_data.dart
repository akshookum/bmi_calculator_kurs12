import 'dart:math';

class BmiData {
  static double bmiCalculate(double height, int kg) {
    final bmiJoop = kg / pow(height / 100, 2);
    return bmiJoop;
  }

  static String? bmiResult(double bmiJoop) {
    if (bmiJoop >= 25) {
      return 'Семиз';
    } else if (bmiJoop > 18.5) {
      return 'Норма';
    } else if (bmiJoop < 18.5) {
      return 'Арык';
    }
    return null;
  }

  static String? giveDescription(double bmiJoop) {
    if (bmiJoop >= 25) {
      return 'Кыймылдоо керек';
    } else if (bmiJoop > 18.5) {
      return 'Салмагыныз нормалдуу эле экен,кыжаалат болбонуз.';
    } else if (bmiJoop < 18.5) {
      return 'Салмак кошунуз!';
    }
    return null;
  }
}
