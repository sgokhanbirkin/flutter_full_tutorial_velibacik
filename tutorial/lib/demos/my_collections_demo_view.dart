import 'package:flutter/material.dart';

class MyCollectionDemosView extends StatefulWidget {
  const MyCollectionDemosView({Key? key}) : super(key: key);

  @override
  State<MyCollectionDemosView> createState() => _MyCollectionDemosViewState();
}

class _MyCollectionDemosViewState extends State<MyCollectionDemosView> {
  final String title = 'My Collections';

  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        padding: PaddingUtility().paddingHorizontal,
        itemBuilder: ((context, index) {
          return _CategoryCard(model: _items[index]);
        }),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: Padding(
        padding: PaddingUtility().paddingGeneral,
        child: Column(
          children: [
            Image.asset(
              _model.imagePath,
              fit: BoxFit.cover,
              height: 200,
            ),
            Padding(
              padding: PaddingUtility().paddingTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_model.title),
                  Text('${_model.price} eth'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(
          imagePath: ProjectImages.imageCollection + 'image_collection.png', title: 'Abstract Art', price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection + 'image_collection.png', title: 'Abstract Art2', price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection + 'image_collection.png', title: 'Abstract Art3', price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection + 'image_collection.png', title: 'Abstract Art4', price: 3.4),
    ];
  }
}

class PaddingUtility {
  final EdgeInsets paddingGeneral = const EdgeInsets.all(20);
  final EdgeInsets paddingTop = const EdgeInsets.only(top: 10);
  final EdgeInsets paddingBottom = const EdgeInsets.only(bottom: 20);
  final EdgeInsets paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
}

class ProjectImages {
  static const imageCollection = 'assets/images/png/';
}
