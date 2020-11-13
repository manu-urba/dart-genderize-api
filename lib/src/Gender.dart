// Copyright (c) 2020, 'manu-urba'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

/// This is the class which the API response is converted into.
class Gender {
  final String name;

  /// It indicates the certainty of the assigned gender.
  /// Basically the ratio of male to females.
  final String gender;
  final double probability;

  /// It represents the number of data rows examined in order to calculate the response.
  final int count;

  const Gender(
      {@required this.name,
      @required this.gender,
      @required this.probability,
      @required this.count});
}

/// This is the class which the API response is converted into in case a `country_id` is specified.
class LocaleGender {
  final String name;

  /// It indicates the certainty of the assigned gender.
  /// Basically the ratio of male to females.
  final String gender;
  final double probability;

  /// It represents the number of data rows examined in order to calculate the response.
  final int count;

  /// All services follow [ISO 3166-1 alpha-2](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)
  /// Check [API data](https://genderize.io/our-data) to see a list of all supported countries.
  final String country_id;

  const LocaleGender(
      {@required this.name,
      @required this.gender,
      @required this.probability,
      @required this.count,
      @required this.country_id});
}
