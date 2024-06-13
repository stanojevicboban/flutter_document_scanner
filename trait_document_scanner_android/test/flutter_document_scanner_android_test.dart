// Copyright (c) 2021, Christian Betancourt
// https://github.com/criistian14
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/services.dart';
import 'package:trait_document_scanner_android/trait_document_scanner_android.dart';
import 'package:trait_document_scanner_platform_interface/trait_document_scanner_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TraitDocumentScannerAndroid', () {
    const kPlatformName = 'Android';
    late TraitDocumentScannerAndroid flutterDocumentScanner;
    late List<MethodCall> log;

    setUp(() async {
      flutterDocumentScanner = TraitDocumentScannerAndroid();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(flutterDocumentScanner.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      TraitDocumentScannerAndroid.registerWith();
      expect(
        TraitDocumentScannerPlatform.instance,
        isA<TraitDocumentScannerAndroid>(),
      );
    });

    test('getPlatformName returns correct name', () async {
      // final name = await flutterDocumentScanner.getPlatformName();
      // expect(
      //   log,
      //   <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      // );
      // expect(name, equals(kPlatformName));
    });
  });
}
