import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Made in Flutter by ',
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: _launchITM,
          child: Image.network(
            'https://media-exp1.licdn.com/dms/image/C4D0BAQE_Tt6eOZHxCw/company-logo_200_200/0/1593080908874?e=1629936000&v=beta&t=CU_gqLNBKapICY19N72Au4yuzq8UwGFx2J4mrAIygbI',
            height: 48,
            width: 48,
          ),
        )
      ],
    );
  }

  Future<bool> _launchITM() async {
    return await launch('https://it-microsystems.net');
  }
}
