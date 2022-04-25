import 'package:flutter/material.dart';
import 'package:tutorial/202/image_learn_202.dart';
import 'package:tutorial/303/reqres_resource/model/resource_model.dart';
import 'package:tutorial/303/reqres_resource/service/reqres_service.dart';
import 'package:tutorial/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:tutorial/product/extension/string_extension.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/product/global/resource_context.dart';
import 'package:tutorial/product/global/theme_notifier.dart';
import 'package:tutorial/product/service/project_dio.dart';

class ReqresProviderView extends StatefulWidget {
  const ReqresProviderView({Key? key}) : super(key: key);

  @override
  State<ReqresProviderView> createState() => ReqresProviderViewState();
}

class ReqresProviderViewState extends State<ReqresProviderView> with ProjectDioMixin {
  final String title = 'Reqres View';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqressService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
            child: const Icon(Icons.refresh),
          ),
          appBar: AppBar(
            title: context.watch<ReqResProvider>().isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(title),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<ReqResProvider>().saveToLocale(
                        context.read<ResourceContext>(),
                        context.read<ReqResProvider>().resourceItems,
                      );
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ImageLearn202()));
                },
                icon: const Icon(Icons.ac_unit),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(child: _resourceListView(context, context.watch<ReqResProvider>().resourceItems)),
              Selector<ReqResProvider, bool>(
                builder: (context, value, child) {
                  return value ? const Placeholder() : Text(title, style: Theme.of(context).textTheme.headline3);
                },
                selector: (context, provider) {
                  return provider.isLoading;
                },
              ),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Color(items[index].color?.colorValue ?? 0),
          child: Text(
            items[index].name ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
    );
  }
}
