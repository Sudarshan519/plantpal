import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:plantpal/app/core/app_assets/app_assets.dart';

void main() {
  test('app_assets assets test', () {
    expect(File(AppAssets.frame6).existsSync(), true);
    expect(File(AppAssets.logo1_).existsSync(), true);
    expect(File(AppAssets.logo).existsSync(), true);
    expect(File(AppAssets.community1).existsSync(), true);
    expect(File(AppAssets.image51_).existsSync(), true);
    expect(File(AppAssets.image5).existsSync(), true);
    expect(File(AppAssets.market1).existsSync(), true);
    expect(File(AppAssets.naturalProduct1).existsSync(), true);
    expect(File(AppAssets.fiCheck).existsSync(), true);
    expect(File(AppAssets.panaFull).existsSync(), true);
    expect(File(AppAssets.pana).existsSync(), true);
    expect(File(AppAssets.rafiki).existsSync(), true);
    expect(File(AppAssets.rocketLaunch).existsSync(), true);
    expect(File(AppAssets.socialMediaLogo).existsSync(), true);
    expect(File(AppAssets.chart).existsSync(), true);
    expect(File(AppAssets.diary).existsSync(), true);
    expect(File(AppAssets.home).existsSync(), true);
    expect(File(AppAssets.settings).existsSync(), true);
    expect(File(AppAssets.ofl).existsSync(), true);
  });
}
