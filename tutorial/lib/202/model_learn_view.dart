import 'package:flutter/material.dart';
import 'package:tutorial/202/model_learn.dart';

class ModelViewLearn extends StatefulWidget {
  const ModelViewLearn({Key? key}) : super(key: key);

  @override
  State<ModelViewLearn> createState() => _ModelViewLearnState();
}

class _ModelViewLearnState extends State<ModelViewLearn> {
  PostModel8 user9 = PostModel8();

  @override
  void initState() {
    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..id = 1
      ..body = 'vb'
      ..title = 'title';
    final user2 = PostModel2(2, 2, 'vb', 'vb');
    user2.id = 2;

    final user3 = PostModel3(3, 3, 'vb', 'vb');
    //user3.body = 'a'; // error here because body is late final

    final user4 = PostModel4(id: 4, userId: 4, body: '', title: ''); // ok
    // user4.id = 4; // error here because id is final

    final user5 = PostModel5(userId: 5, id: 5, body: '', title: ''); // ok

    final user6 = PostModel6(userId: 6, id: 6, body: '', title: ''); // ok
    //user6._body = 'a'; // safety

    final user7 = PostModel7(); // ok

    final user8 = PostModel8(title: 'Title');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user9.title ?? 'no title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user9.body ?? 'empty body'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = PostModel8(title: 'Title');
            user9.updateBody('TEST');
          });
        },
      ),
    );
  }
}
