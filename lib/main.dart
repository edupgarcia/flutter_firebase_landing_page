import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LinkLandingPage(),
    );
  }
}

class LinkLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(imageURL),
              backgroundColor: Colors.white,
              radius: 48,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'edupgarcia.ti',
              style: (TextStyle(
                fontSize: 16,
                color: Colors.grey,
              )),
            ),
            SizedBox(
              height: 20,
            ),
            for (var document in documents)
              ButtonLink(
                title: document['title'] ?? '',
                urlString: document['url'] ?? '',
              ),
          ],
        ),
      ),
    );
  }
}

final documents = [
  {
    'title': 'YouTube',
    'url': 'https://www.youtube.com/channel/UCouEQBqS9VeG6_hsjCaHUQw'
  },
  {
    'title': 'LinkedIn',
    'url': 'https://www.linkedin.com/in/eduardopereiragarcia/'
  },
  {'title': 'Website', 'url': 'https://it-microsystems.net'},
];

class ButtonLink extends StatelessWidget {
  const ButtonLink({
    Key? key,
    required this.title,
    required this.urlString,
  }) : super(key: key);

  final String title;
  final String urlString;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: width > 680 ? 680 : width * 0.95,
        height: 40,
        child: TextButton(
          onPressed: () => launch(urlString),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              backgroundColor: Colors.tealAccent,
              fontSize: 16,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.tealAccent,
            ),
          ),
        ),
      ),
    );
  }
}

final imageURL =
    'https://lh3.googleusercontent.com/ogw/ADGmqu-i1QVA_Ki6raOpna-D9uDBYZOVgWoKFiuHGdgOm10=s83-c-mo';
