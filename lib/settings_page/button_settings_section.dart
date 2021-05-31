import 'package:flutter/material.dart';
// import 'package:flutter_firebase_landing_page/constants.dart';
import 'package:flutter_firebase_landing_page/models/link_data.dart';
import 'package:provider/provider.dart';

class ButtonSettingsSection extends StatelessWidget {
  const ButtonSettingsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _documents = Provider.of<List<LinkData>>(context);

    return Expanded(
      flex: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (_documents.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return Container(
            color: Colors.blueGrey,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Your links',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 100),
                SizedBox(
                  width: constraints.maxWidth * 0.6 + 25,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Add button',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.greenAccent.shade400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.6,
                    height: constraints.maxHeight * 0.5,
                    child: ReorderableListView(
                      children: [
                        for (var document in _documents)
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                            tileColor: Colors.blue,
                            title: Text(document.title),
                            key: Key(document.title),
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                            // contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          ),
                      ],
                      onReorder: (oldIndex, newIndex) {},
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
