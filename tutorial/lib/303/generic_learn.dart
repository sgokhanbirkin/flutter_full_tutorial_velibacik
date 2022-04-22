// ignore_for_file: unused_local_variable

class UserManagment<T extends AdminUser> {
  final T admin;

  UserManagment(this.admin);

  void sayName(GenericUser user) {
    //print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;

    for (var item in users) {
      sum += item.money;
    }
    int initialValue = admin.role == 1 ? admin.money : 0;
    final sumMoney = users
        .map(
          (e) => e.money,
        )
        .fold<int>(initialValue, (previousValue, element) => previousValue + (element));
    //print(sumMoney);

    final _money = users.fold<int>(initialValue, (previousValue, element) => previousValue + (element.money));

    //print(_money);
    return _money;
  }

  Iterable<T> showNames(List<GenericUser> users) {
    // bunu sadece role 1 olanlar
    final names = users.map((e) => e.name).cast<T>();
    return names;
  }

  Iterable<R>? showNames2<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users.map((e) => e.name).cast<R>();
      return names;
    }
    return null;
  }

  Iterable<VBModel<R>>? showNames3<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users.map((e) => VBModel<R>(e.name.split('').toList().cast<R>()));
      return names;
    }
    return null;
  }
}

class VBModel<T> {
  final String name = 'sgb';
  final List<T> items;

  VBModel(this.items);
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(
    this.name,
    this.id,
    this.money,
  );
}

class AdminUser extends GenericUser {
  final int role;

  AdminUser(String name, String id, int money, this.role) : super(name, id, money);
}
