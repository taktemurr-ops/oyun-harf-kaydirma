import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_harf_kaydirma/oyun_harf_kaydirma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(harfKaydirmaConfig.title.length, 33);
    expect(harfKaydirmaConfig.tagline.length, 33);
    for (final s in harfKaydirmaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(harfKaydirmaConfig.gameId, harfKaydirmaId);
    expect(harfKaydirmaRules.gameId, harfKaydirmaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(harfKaydirmaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: harfKaydirmaId, optionalMechanics: harfKaydirmaRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      harfKaydirmaRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(harfKaydirmaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
