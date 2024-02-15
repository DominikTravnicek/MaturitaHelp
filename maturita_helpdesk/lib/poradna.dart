

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maturita_helpdesk/faq.dart';
import 'package:maturita_helpdesk/forum_screen.dart';
import 'package:maturita_helpdesk/home_screen.dart';
import 'package:maturita_helpdesk/maturitaInfo.dart';

import 'about_screen.dart';

class PoradnaScreen extends StatefulWidget {
  const PoradnaScreen({Key? key}) : super(key: key);

  @override
  State<PoradnaScreen> createState() => _PoradnaScreenState();
}


bool _isLoading = true;

class _PoradnaScreenState extends State<PoradnaScreen> {
  


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
      body: 
        
          SingleChildScrollView(
            child: Center(
            
            child: Column(children: [
              
            
            Padding(padding: EdgeInsets.all(20), child: Text("Poradna", style: TextStyle(color: Colors.white, fontSize: 25),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Plánování a organizace:",
            style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(20), child: Text("Začněte s časnou přípravou a vytvořte si plán studia. Nenechávejte věci na poslední chvíli. Rozdělte si učivo na menší úkoly a vytvořte si reálný harmonogram, abyste měli jasný přehled o tom, co musíte udělat.",
             style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Zdravý životní styl:",
            style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(20), child: Text("Dbejte na dostatek spánku. Nedostatek spánku může zhoršit stres a ovlivnit kognitivní funkce.Stravujte se vyváženě a pravidelně cvičte. Fyzická aktivita může pomoci snížit stres a zlepšit náladu.",
             style: TextStyle(color: Colors.white),),),
             Padding(padding: EdgeInsets.all(10), child: Text("Dýchací cvičení a relaxace:",
            style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(20), child: Text("Naučte se techniky hlubokého dýchání. Pomáhá to uvolnit napětí a zklidnit mysl. Pravidelně praktikujte relaxační techniky, jako je meditace nebo jóga, abyste udrželi klidnou mysl.",
             style: TextStyle(color: Colors.white),),),
             Padding(padding: EdgeInsets.all(10), child: Text("Pozitivní myšlení:",
            style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(20), child: Text("Zaměřte se na pozitivní stránky situace. Přemýšlejte o tom, co jste již úspěšně dokázali a co se vám daří. Zkuste nahradit negativní myšlenky pozitivními afirmacemi.",
             style: TextStyle(color: Colors.white),),),
             Padding(padding: EdgeInsets.all(10), child: Text("Dostatek odpočinku:",
            style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(20), child: Text("Udělejte si krátké přestávky během studia, abyste si odpočinuli a zabránili přetížení mysli. Před samotnou zkouškou si dopřejte klidný čas na relaxaci.",
             style: TextStyle(color: Colors.white),),),
          Padding(padding: EdgeInsets.all(10), child: Text("Příprava na zkoušku:",
            style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(20), child: Text("Pravidelně si opakujte učivo, abyste se cítili více sebejistí. Zkoušejte se praktickými otázkami nebo simulujte podmínky zkoušky, abyste si zvykli na stresovou situaci.",
             style: TextStyle(color: Colors.white),),),
             Padding(padding: EdgeInsets.all(10), child: Text("Podpora od ostatních:",
            style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(20), child: Text("Hovořte s přáteli, rodinou nebo učiteli o svém stresu. Sdílení pocitů může být užitečné. Zajímejte se o podporu od ostatních studentů, kteří procházejí stejným obdobím.",
             style: TextStyle(color: Colors.white),),),
            ],)
          ),
          )
      ,
    );
  }
}
