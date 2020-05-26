import 'package:flutter/material.dart';

void main() {
  runApp(RecipeMain());
}

class RecipeMain extends StatefulWidget {
  @override
  _RecipeMainState createState() => _RecipeMainState();
}

class _RecipeMainState extends State<RecipeMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome To Yummy World'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Card(
                elevation: 10,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('tabbed');
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.network(
                          'https://lh3.googleusercontent.com/proxy/upcxnyixykXLoKtgdG0g6tHSB654ujX0ZkiVGAq07Or6VjFkV3Y89L6vfi92cKIfSMnpnB2BcQGbR6QW6T31DcThrBQlnYg9AhYcyFZSBXGuVrfqJVB69JqaVH8kM12d4JWzs_GWfGbSjuxyS7P-5p84XagFocTB5swXMnieFvsKrrZxTLphes5WJoBZNL8S6E1jP40rEc7cu9f4ggejlBQYl1LpIdDc4JjPtYZrlPgJDqqSx6EzInVh99Exctom-mfGiMIcGyVvLRiUNvC-zeRddShzwB-yh-OPU-GRlg',
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 20, bottom: 10),
                            child: Text(
                              '떡뽁이',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Icon(
                            Icons.access_alarm,
                          ),
                          Text(' 45 분'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
