import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'TextButton',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                }
                return Colors.red;
              }),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ElevatedButton'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              // service istek at
              // sayfanın rengini düzenle
            },
            shape: ShapeBorder.lerp(
              BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              5.5,
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Row(
              children: const [
                Icon(Icons.add),
                Text('Add'),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {},
              child: const Text(
                'OutlineButton',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Text('Custom'),
          ),
          OutlinedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 12),
                child: Text('ss'),
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              height: 200,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 40, left: 40),
              child: Text(
                'Place Bid',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Borders : 
// CircleBorder() RoundedRectangleBorder()