import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial/303/generic_learn.dart';

void main() {
  setUp(() {});
  test('User calculate', () {
    final users = [
      const GenericUser('11', 'name1', 1),
      const GenericUser('11', 'name2', 2),
      const GenericUser('11', 'name3', 3),
    ];

    final userManagment = UserManagment(const AdminUser('', '', 1, 1));
    final result = UserManagment(const AdminUser('', '', 1, 1)).calculateMoney(users);

    // ignore: unused_local_variable
    final response = userManagment.showNames2<String>(users);

    expect(result, 7);
  });
}
