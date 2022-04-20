import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial/303/generic_learn.dart';

void main() {
  setUp(() {});
  test('User calculate', () {
    final users = [
      GenericUser('11', 'name1', 1),
      GenericUser('11', 'name2', 2),
      GenericUser('11', 'name3', 3),
    ];

    final userManagment = UserManagment(AdminUser('', '', 1, 1));
    final result = UserManagment(AdminUser('', '', 1, 1)).calculateMoney(users);

    final response = userManagment.showNames2<String>(users);

    expect(result, 7);
  });
}
