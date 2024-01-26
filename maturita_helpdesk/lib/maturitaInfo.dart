

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maturita_helpdesk/about_screen.dart';
import 'package:maturita_helpdesk/faq.dart';
import 'package:maturita_helpdesk/forum_screen.dart';
import 'package:maturita_helpdesk/home_screen.dart';
import 'package:maturita_helpdesk/poradna.dart';

class MaturitaScreen extends StatefulWidget {
  const MaturitaScreen({Key? key}) : super(key: key);

  @override
  State<MaturitaScreen> createState() => _MaturitaScreenState();
}


bool _isLoading = true;

class _MaturitaScreenState extends State<MaturitaScreen> {
  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    
  }



  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text("Maturita Helpdesk"),),
        actions: <Widget>[
          TextButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MaturitaScreen()));
          }, child: Text("Informace o maturitě")),
          TextButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
          }, child: Text("O webu")),
          TextButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FaqScreen()));
          }, child: Text("Časté otázky")),
          TextButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ForumScreen()));
          }, child: Text("Forum a diskuze")),
          TextButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PoradnaScreen()));
          }, child: Text("Poradna")),
        ],
      ),
      body: Center(
        child:
          SingleChildScrollView(
            child: Container(
            width: 1000,
            child: Column(children: [
              Container(
            width: 1000,
            child: Text(""),
          )
            ],)
          ),
          )
        
      )
      ,
    );
  }
}
