import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _DurationItems._durationLow,
    );
  }

  String title = 'Animated View';
  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController _controller;

  void changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisible();
          _controller.animateTo(_isVisible ? 1.0 : kZero);
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              child: TextWidget(text: 'data'),
              opacity: _isOpacity ? 1.0 : kZero,
              duration: _DurationItems._durationLow,
            ),
            trailing: IconButton(
              onPressed: () {
                changeOpacity();
              },
              icon: const Icon(Icons.remove_red_eye),
            ),
          ),
          AnimatedDefaultTextStyle(
            child: const Text('Data'),
            style: (_isVisible ? context.textTheme().headline1 : context.textTheme().subtitle1) ?? const TextStyle(),
            duration: _DurationItems._durationLow,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
          AnimatedContainer(
            duration: _DurationItems._durationLow,
            height: _isVisible ? kZero : MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.height * 0.2,
            color: Colors.red,
            margin: const EdgeInsets.all(20),
          ),
          Expanded(
              child: Stack(
            children: const [
              AnimatedPositioned(
                top: 60,
                curve: Curves.elasticInOut,
                child: Text('Data'),
                duration: _DurationItems._durationLow,
              ),
            ],
          )),
          Expanded(
            child: AnimatedList(
              key: const ValueKey<int>(0),
              initialItemCount: 10,
              itemBuilder: (context, index, animation) {
                return const Text('DATAAAA');
              },
            ),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox(),
      crossFadeState: _isVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: _DurationItems._durationLow,
    );
  }
}

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  TextWidget({Key? key, this.text}) : super(key: key);
  String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: context.textTheme().headline2,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const _durationLow = Duration(seconds: 1);
}
