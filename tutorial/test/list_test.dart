// ignore_for_file: avoid_print, unused_local_variable, unrelated_type_equality_checks

import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial/303/generic_learn.dart';
import 'package:tutorial/product/widget/card/high_card.dart';

void main() {
  setUp(() {});
  test('List best of', () {
    List<GenericUser> users = [
      const GenericUser('vb1', 'name1', 1),
      const GenericUser('vb2', 'name2', 8),
      const GenericUser('vb3', 'name3', 11),
    ];

    try {
      final response = users.singleWhere((element) => element.findUserName('x'), orElse: () {
        return const GenericUser('name', 'id', 1);
      });
      print(response);
    } catch (e) {
      print(e);
    }

    log(users.where((element) => element.money > 5).toString());
    print(users.where((element) => element.money > 5));

    users.addAll([const GenericUser('name', 'id', 5)]);
    users.asMap().forEach((index, element) {
      print('$index: $element');
    });
    // users.lastWhere((element) => element.id == 5);
    users.take(2);
    users.removeAt(2);
    users.remove(const GenericUser('vb1', 'name2', 3));
    users.removeWhere((element) => element.id == 'name2');
    users.indexOf(const GenericUser('name', 'id', 1));
    final result = users.indexWhere((element) => element.id == 'name2');
    if (result > 0) {
      users[result] = const GenericUser('name', 'id', 11);
    }

    users.map((e) => e.money).map((e) => e + 1).forEach((e) => print(e));
    users.map((e) => e.money).where((element) => element > 5).forEach((e) => print(e));

    users.lastOrNull;

    users.forEachIndexed((index, element) {
      // index, element
      print('$index: $element');
    });

    users.expand((element) => [const GenericUser('1', 'name', 15)]);

    users.sample(3);

    print(users.contains(const GenericUser('vb1', 'name1', 1)));
  });

  test('List best of with collection', () {
    List<GenericUser> users = [
      const GenericUser('vb1', 'name1', 1),
      const GenericUser('vb2', 'name2', 2),
      const GenericUser('vb3', 'name3', 3),
    ];

    List<HighCard> highCard = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    users.lastWhereOrNull((element) => element.id == 5);

    final response = users.singleWhereOrNull((element) => element.findUserName('x'));
    print(response);
  });
}
