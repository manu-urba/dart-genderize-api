// Copyright (c) 2020, 'manu-urba'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:genderize/genderize.dart';

const kNames = ['Manuel', 'Emily'];

void main() async {
  /// Initializing an instance of [Genderize]
  var gen = Genderize();

  /// Getting a [Gender] of a [List] of [name]s".
  var genders = await gen.getMultipleGenders(kNames);

  for (var i = 0; i < kNames.length; ++i) {
    print('${kNames[i]} is ${genders[i].gender}');
  }

  gen.close();
}
