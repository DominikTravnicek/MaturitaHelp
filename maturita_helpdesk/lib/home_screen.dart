
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maturita_helpdesk/about_screen.dart';
import 'package:maturita_helpdesk/faq.dart';
import 'package:maturita_helpdesk/forum_screen.dart';
import 'package:maturita_helpdesk/mat_okruhy/pog.dart';
import 'package:maturita_helpdesk/mat_okruhy/pos.dart';
import 'package:maturita_helpdesk/mat_okruhy/prg.dart';
import 'package:maturita_helpdesk/mat_okruhy/swa.dart';
import 'package:maturita_helpdesk/maturitaInfo.dart';
import 'package:maturita_helpdesk/poradna.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool _isLoading = true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text("Maturita Helpdesk"),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MaturitaScreen()));
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
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Vítejte na webu Maturitní Helpdesk",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Termíny konáni",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Didaktické testy společné části maturitní zkoušky se v jarním zkušebním období 2024 budou konat 2.–7. května 2024, v podzimním zkušebním období pak 1.–10. září 2024. Zkoušky profilové části se v jarním zkušebním období budou konat v období od 16. května do 10. června 2024. Konkrétní termíny stanoví ředitel školy nejpozději 2 měsíce před konáním zkoušek. V podzimním zkušebním období je pro konání zkoušek profilové části vyhrazeno období 1.–20. září 2024.",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Hodnocení písemné práce tvoří 40 % celkového hodnocení příslušné zkoušky, hodnocení ústní zkoušky pak tvoří zbývajících 60 %",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PogScreen()));
                  },
                  child: Text("Odkaz na maturitní okruhy předmětu POG")),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SwaScreen()));
                  },
                  child: Text("Odkaz na maturitní okruhy předmětu SWA")),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PosScreen()));
                  },
                  child: Text("Odkaz na maturitní okruhy předmětu POS")),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PrgScreen()));
                  },
                  child: Text("Odkaz na maturitní okruhy předmětu PRG")),
            ],
          )),
        ));
  }
}
