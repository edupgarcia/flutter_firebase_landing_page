// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_landing_page/links_landing_page/button_link.dart';
import 'package:flutter_firebase_landing_page/constants.dart';
import 'package:flutter_firebase_landing_page/links_landing_page/footer.dart';
import 'package:flutter_firebase_landing_page/models/link_data.dart';
import 'package:provider/provider.dart';

class LinksLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot>(
    //     stream: FirebaseFirestore.instance.collection('links').snapshots(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(child: CircularProgressIndicator());
    //       }

    //       final _documents = snapshot.data!.docs.map((doc) {
    //         return LinkData.fromMap(doc.data() as Map<String, dynamic>);
    //       }).toList();

    //     });

    final _documents = Provider.of<List<LinkData>>(context);

    if (_documents.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

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
            if (_documents.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Have not added some links'),
              ),
            for (var document in _documents)
              ButtonLink(
                title: document.title,
                url: document.url,
              ),
            Spacer(),
            Footer(),
            SizedBox(height: 23),
          ],
        ),
      ),
    );
  }
}
