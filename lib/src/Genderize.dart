// Copyright (c) 2020, 'manu-urba'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dio/dio.dart';
import 'Gender.dart';

/// The base class which allows to create a genderize client.
///
/// You have to create an instance of this class to start working with this package.
class Genderize {
  /// Optional parameter of API key
  ///
  /// If you need to predict more than 1000 names/day you need to obtain an API key
  /// from [store.genderize.io](https://store.genderize.io).
  String _apiKey;
  final _dio = Dio(BaseOptions(baseUrl: 'https://api.genderize.io'));

  final Map<String, String> _parameters = Map();

  Genderize({String apiKey}) {
    this._apiKey = apiKey;
    _parameters.addAll({'apiKey': _apiKey});
  }

  /// Shuts down the genderize client.
  ///
  /// If [force] is `false` (the default) the [Genderize] client will be kept alive
  /// until all active connections are done. If [force] is `true` any active
  /// connections will be closed to immediately release all resources. These
  /// closed connections will receive an error event to indicate that the client
  /// was shut down. In both cases trying to establish a new connection after
  /// calling [close] will throw an exception.
  void close({bool force = false}) => _dio.close(force: force);

  /// Returns a single [Gender] instance.
  Future<Gender> getGender(String name) async {
    var params = {'name': name};
    if (_parameters['apiKey'] != null) params.addAll(_parameters);
    var res = await _dio.get('', queryParameters: params);
    var data = res.data;

    return Gender(
      name: data['name'],
      gender: data['gender'],
      probability: data['probability'].toDouble(),
      count: data['count'],
    );
  }

  /// Returns a [List] of [Gender]s.
  ///
  /// You can infer the gender of up to 10 names at a time.
  Future<List<Gender>> getMultipleGenders(List<String> names) async {
    Map<String, dynamic> map = Map();

    for (var i = 0; i < names.length; ++i) map.addAll({'name[$i]': names[i]});

    if (_parameters['apiKey'] != null) map.addAll(_parameters);
    var res = await _dio.get('', queryParameters: map);
    var data = res.data;

    List<Gender> list = List();
    for (var i = 0; i < data.length; ++i) {
      list.add(
        Gender(
          name: data[i]['name'],
          gender: data[i]['gender'],
          probability: data[i]['probability'].toDouble(),
          count: data[i]['count'],
        ),
      );
    }
    return list;
  }

  /// Classifies genders in the scope of a specific country, it retrieves a [LocaleGender] of it.
  Future<LocaleGender> getLocaleGender({String name, String country_id}) async {
    var params = {'name': name};
    if (_parameters['apiKey'] != null) params.addAll(_parameters);
    var res = await _dio.get('', queryParameters: params);
    var data = res.data;

    return LocaleGender(
      name: data['name'],
      gender: data['gender'],
      probability: data['probability'].toDouble(),
      count: data['count'],
      country_id: data['country_id'],
    );
  }

  /// Classifies genders in the scope of a specific country, it retrieves a [List] of [LocaleGender]s.
  Future<List<LocaleGender>> getMultipleLocaleGenders(
      List<String> names, String country_id) async {
    Map<String, dynamic> map = Map();

    for (var i = 0; i < names.length; ++i) map.addAll({'name[$i]': names[i]});
    map.addAll({'country_id': country_id});
    if (_parameters['apiKey'] != null) map.addAll(_parameters);

    var res = await _dio.get('', queryParameters: map);
    var data = res.data;

    List<LocaleGender> list = List();
    for (var i = 0; i < data.length; ++i) {
      list.add(
        LocaleGender(
          name: data[i]['name'],
          gender: data[i]['gender'],
          probability: data[i]['probability'].toDouble(),
          count: data[i]['count'],
          country_id: data[i]['country_id'],
        ),
      );
    }
    return list;
  }
}
