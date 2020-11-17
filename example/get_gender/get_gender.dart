// Copyright (c) 2020, 'Manuel Urbano'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:genderize/genderize.dart';

void main() async {
  /// Initializing an instance of [Genderize]
  var gen = Genderize();

  /// Getting a [Gender] of [name] "Manuel".
  var gender = await gen.getGender('Manuel');

  if (gender.probability > 0.50) {
    print('You are ${gender.gender}');
  } else {
    print('Pretty sure you are ${gender.gender}');
  }

  gen.close();
}
