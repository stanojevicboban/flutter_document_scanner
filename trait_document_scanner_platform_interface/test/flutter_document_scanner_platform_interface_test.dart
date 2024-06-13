// Copyright (c) 2021, Christian Betancourt
// https://github.com/criistian14
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:trait_document_scanner_platform_interface/trait_document_scanner_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class TraitDocumentScannerMock extends TraitDocumentScannerPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('TraitDocumentScannerPlatformInterface', () {
    late TraitDocumentScannerPlatform flutterDocumentScannerPlatform;

    setUp(() {
      flutterDocumentScannerPlatform = TraitDocumentScannerMock();
      TraitDocumentScannerPlatform.instance = flutterDocumentScannerPlatform;
    });

    // group('getPlatformName', () {
    //   test('returns correct name', () async {
    //     expect(
    //       await TraitDocumentScannerPlatform.instance.getPlatformName(),
    //       equals(TraitDocumentScannerMock.mockPlatformName),
    //     );
    //   });
    // });
  });
}
