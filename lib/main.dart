import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_landing_page/links_landing_page/links_landing_page.dart';
import 'package:flutter_firebase_landing_page/models/link_data.dart';
import 'package:flutter_firebase_landing_page/not_found_page.dart';
import 'package:flutter_firebase_landing_page/settings_page/settings_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseFirestore.instance.settings = Settings(
    host: 'localhost:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final linksCollection = FirebaseFirestore.instance.collection('links');
    final userLinkDataStream = linksCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LinkData.fromMap(doc.data());
      }).toList();
    });
    // return StreamBuilder<QuerySnapshot>(
    //     stream: FirebaseFirestore.instance.collection('links').snapshots(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(child: CircularProgressIndicator());
    //       }

    //       final _documents = snapshot.data!.docs.map((doc) {
    //         return LinkData.fromMap(doc.data() as Map<String, dynamic>);
    //       }).toList();

    //       // return Provider<List<LinkData>>(
    //       // create: (context) => _documents,
    //       // return ProxyProvider0<List<LinkData>>(
    //       // update: (context, linkDataList) => _documents,
    //     });

    return StreamProvider<List<LinkData>>(
      initialData: [],
      create: (context) => userLinkDataStream,
      child: MaterialApp(
        title: 'Flutter Firebase Landing Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LinksLandingPage(),
          '/settings': (context) => SettingsPage(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return NotFoundPage();
            },
          );
        },
        // home: LinkLandingPage(),
        // home: SettingsPage(),
      ),
    );
  }
}
