

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maturita_helpdesk/about_screen.dart';
import 'package:maturita_helpdesk/forum_screen.dart';
import 'package:maturita_helpdesk/home_screen.dart';
import 'package:maturita_helpdesk/maturitaInfo.dart';
import 'package:maturita_helpdesk/poradna.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}


bool _isLoading = true;

class _FaqScreenState extends State<FaqScreen> {
  


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
      body: 
        
          SingleChildScrollView(
            child: Center(
            
            child: Column(children: [
              
            
            Padding(padding: EdgeInsets.all(20), child: Text("Časté otázky", style: TextStyle(color: Colors.white, fontSize: 25),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Jak dlouho mám na přípravu na zkoušku?", style: TextStyle(color: Colors.white, fontSize: 18),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Odpověď: Délka přípravy na zkoušku se může lišit podle typu zkoušky, její obtížnosti a vašich individuálních potřeb. Většinou je doporučeno začít se připravovat několik týdnů před datem zkoušky.",
             style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Jak se efektivně připravit na zkoušku?", style: TextStyle(color: Colors.white, fontSize: 18),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Odpověď:Stanovte si plán: Vytvořte si plán učení a rozvrhujte si čas na různé části materiálu.Záznamy a poznámky: Zpřehledněte si poznámky, záznamy a učební materiály.Praxe s otázkami: Procvičujte otázky z předchozích let, abyste se seznámili s formátem zkoušky.Grupová studia: Pokud je to možné, studujte s ostatními. Diskuze a výměna názorů mohou být prospěšné.",
             style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Jak se vyhnout stresu před zkouškou?", style: TextStyle(color: Colors.white, fontSize: 18),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Odpověď:Zdravý životní styl: Dodržujte zdravý životní styl s dostatkem spánku, stravou a cvičením.Přestávky: Udržujte rovnováhu mezi učením a odpočinkem. Pravidelně si dávejte krátké přestávky.Pozitivní myšlení: Zaměřte se na pozitivní stránky učení a zvyšte si sebedůvěru.",
             style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Jak efektivně využít čas při samostudiu?", style: TextStyle(color: Colors.white, fontSize: 18),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Odpověď:Prioritizace úkolů: Identifikujte klíčová témata a priority pro studium.Aktivní učení: Zapojte se do aktivního učení, jako je vytváření poznámek, diskuse a cvičení.Sledování pokroku: Pravidelně monitorujte svůj pokrok a upravujte svůj plán podle potřeby.",
             style: TextStyle(color: Colors.white),),),
          
            ],)
          ),
          )
        
      
      ,
    );
  }
}
