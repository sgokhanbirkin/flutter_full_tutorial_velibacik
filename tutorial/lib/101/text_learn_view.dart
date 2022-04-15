import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({
    Key? key,
    this.userName,
  }) : super(key: key);

  final String data = "Gökhan";
  final String? userName;
  final ProjectKeys keys = ProjectKeys();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome $data ${data.length}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle,
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome $data ${data.length}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle,
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome $data ${data.length}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: ProjectColors.welcomeColor,
                  ),
            ),
            const SizedBox(height: 20),
            Text(userName ?? ''),
            const SizedBox(height: 20),
            Text(
              keys.welcomeString,
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.lime,
    wordSpacing: 2,
    letterSpacing: 4,
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcomeString = 'Welcome';
}
