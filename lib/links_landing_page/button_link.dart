import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonLink extends StatelessWidget {
  const ButtonLink({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;
  final Color backColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: SizedBox(
            width: width > 680 ? 680 : width * 0.95,
            height: 40,
            child: TextButton(
              onPressed: () => launch(url),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: backColor,
                  fontSize: 16,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  backColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
