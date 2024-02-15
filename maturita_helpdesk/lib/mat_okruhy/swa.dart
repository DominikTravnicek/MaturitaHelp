import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maturita_helpdesk/about_screen.dart';
import 'package:maturita_helpdesk/column_builder.dart';
import 'package:maturita_helpdesk/faq.dart';
import 'package:maturita_helpdesk/forum_screen.dart';
import 'package:maturita_helpdesk/home_screen.dart';
import 'package:maturita_helpdesk/maturitaInfo.dart';
import 'package:maturita_helpdesk/poradna.dart';
import 'package:url_launcher/url_launcher.dart';

class SwaScreen extends StatefulWidget {
  const SwaScreen({Key? key}) : super(key: key);

  @override
  State<SwaScreen> createState() => _SwaScreenState();
}

bool _isLoading = true;

class _SwaScreenState extends State<SwaScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  _launchURL(String u) async {
   final Uri url = Uri.parse(u);
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

  Widget build(BuildContext context) {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('predmety')
        .doc('SWA')
        .collection("maturitni_okruhy");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Text("Maturita Helpdesk"),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MaturitaScreen()));
              },
              child: Text("Informace o maturitě")),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
              child: Text("O webu")),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FaqScreen()));
              },
              child: Text("Časté otázky")),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ForumScreen()));
              },
              child: Text("Forum a diskuze")),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PoradnaScreen()));
              },
              child: Text("Poradna")),
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: StreamBuilder(
            stream: query.snapshots(),
            builder: ((BuildContext context, snapshot) {
              return ColumnBuilder(
                itemCount: snapshot.data?.docs.length ?? 0,
                itemBuilder: (context, index) {
                  final docs = snapshot.data!.docs;
                  final data = docs[index].data();
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      constraints: BoxConstraints(
                                          minHeight: 200,
                                          maxWidth: 500,
                                        ),  
                      child: Column(children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: TextButton(child: Text(data['Nadpis']), onPressed: () {
                            _launchURL(data['Odkaz']);
                          },),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(data['Text'],style: TextStyle(color: Colors.white),),
                        )
                      ]),
                    ),
                  );
                },
              );
            })),
      )),
    );
  }
}
