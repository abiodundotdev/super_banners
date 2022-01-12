import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:super_banners/super_banners.dart';

void main() {
  group("Banner", () {
    _bannerGoldenTest(
      "top left corner",
      'banner_top-left',
      const PositionedBanner(
        bannerPosition: BannerPosition.topLeft,
        bannerColor: Colors.blue,
        child: Text("Hello, World!"),
      ),
    );

    _bannerGoldenTest(
      "top right corner",
      'banner_top-right',
      const PositionedBanner(
        bannerPosition: BannerPosition.topRight,
        bannerColor: Colors.blue,
        child: Text("Hello, World!"),
      ),
    );

    _bannerGoldenTest(
      "bottom right corner",
      'banner_bottom-right',
      const PositionedBanner(
        bannerPosition: BannerPosition.bottomRight,
        bannerColor: Colors.blue,
        child: Text("Hello, World!"),
      ),
    );

    _bannerGoldenTest(
      "bottom left corner",
      'banner_bottom-left',
      const PositionedBanner(
        bannerPosition: BannerPosition.bottomLeft,
        bannerColor: Colors.blue,
        child: Text("Hello, World!"),
      ),
    );
  });

  group("built with Flutter", () {
    _bannerGoldenTest(
      "top left",
      'built-with-flutter_top-left',
      const BuiltWithFlutterBanner.positioned(
        bannerPosition: BannerPosition.topLeft,
        bannerColor: Color(0xFF17191c),
        elevation: 5,
      ),
    );

    _bannerGoldenTest(
      "top right",
      'built-with-flutter_top-right',
      const BuiltWithFlutterBanner.positioned(
        bannerPosition: BannerPosition.topRight,
        bannerColor: Color(0xFF17191c),
        elevation: 5,
      ),
    );

    _bannerGoldenTest(
      "bottom right",
      'built-with-flutter_bottom-right',
      const BuiltWithFlutterBanner.positioned(
        bannerPosition: BannerPosition.bottomRight,
        bannerColor: Color(0xFF17191c),
        elevation: 5,
      ),
    );

    _bannerGoldenTest(
      "bottom left",
      'built-with-flutter_bottom-left',
      const BuiltWithFlutterBanner.positioned(
        bannerPosition: BannerPosition.bottomLeft,
        bannerColor: Color(0xFF17191c),
        elevation: 5,
      ),
    );
  });
}

void _bannerGoldenTest(String description, String goldenName, Widget banner) {
  testGoldens(description, (tester) async {
    tester.binding.window
      ..physicalSizeTestValue = const Size(200, 200)
      ..devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(
      _buildBannerDemo(
        child: banner,
      ),
    );

    await screenMatchesGolden(tester, goldenName);

    tester.binding.window.clearAllTestValues();
  });
}

Widget _buildBannerDemo({
  required Widget child,
}) {
  return MaterialApp(
    home: Scaffold(
      body: Stack(
        children: [
          child,
        ],
      ),
    ),
    debugShowCheckedModeBanner: false,
  );
}
