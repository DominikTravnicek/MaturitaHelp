

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maturita_helpdesk/about_screen.dart';
import 'package:maturita_helpdesk/column_builder.dart';
import 'package:maturita_helpdesk/faq.dart';
import 'package:maturita_helpdesk/home_screen.dart';
import 'package:maturita_helpdesk/maturitaInfo.dart';

import 'poradna.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}


bool _isLoading = true;

class _ForumScreenState extends State<ForumScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController text=new TextEditingController();
  TextEditingController nick=new TextEditingController();

  @override
  void initState() {
    getUserDetails();
    super.initState();
    
    
  }
Future getUserDetails() async {
    User user = auth.currentUser!;
    var uid = user.uid;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      if (userDoc.data() != null) {
        final data = userDoc.data() as Map<String, dynamic>;
        nick.text=data['nick'];
      }
    });
  }

  Future _handlePressed() async{
    var name=(DateTime.now()).toString();
    await FirebaseFirestore.instance.collection('forum').doc(name).set({
      'author':nick.text,
      'content':text.text,
    });
    text.clear();
  }


  
  
  Widget build(BuildContext context) {
        Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('forum');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text("Maturita Helpdesk"),),
        actions: <Widget>[
          TextButton(onPressed:() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MaturitaScreen()));
          }, child: Text("Informace o maturitě")),
          TextButton(onPressed:() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AboutScreen()));
          }, child: Text("O webu")),
          TextButton(onPressed:() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FaqScreen()));
          }, child: Text("Časté otázky")),
          TextButton(onPressed:() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForumScreen()));
          }, child: Text("Forum a diskuze")),
          TextButton(onPressed:() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PoradnaScreen()));
          }, child: Text("Poradna")),
        ],
      ),
      body: Center(
        child:
          Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: 1500,
                  height: MediaQuery.of(context).size.height*0.85,
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
                                              minHeight: 30,
                                              maxWidth: 500,
                                            ),  
                          child: Column(children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(data['author'], style: TextStyle(color: Colors.white),),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(data['content'],style: TextStyle(color: Colors.white),),
                            )
                          ]),
                        ),
                      );
                    },
                  );
                })),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 1500,
                    height: 50,
                    child: TextField(
                    style: const TextStyle(color: Color(0xff4A4A48)),
                    controller: text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff2A3044)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Napiš příspěvek do fóra',
                      hintStyle: const TextStyle(color: Color(0xff4A4A48)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                                ),
                  ),
                  IconButton(onPressed: (){
                    _handlePressed();
                  }, icon: Icon(Icons.send),color: Colors.white,)
                ],
              ),
            ],
          )
        
      )
      ,
    );
  }
}
