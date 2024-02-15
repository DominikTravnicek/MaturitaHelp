

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maturita_helpdesk/faq.dart';
import 'package:maturita_helpdesk/forum_screen.dart';
import 'package:maturita_helpdesk/home_screen.dart';
import 'package:maturita_helpdesk/maturitaInfo.dart';
import 'package:maturita_helpdesk/poradna.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}


bool _isLoading = true;

class _AboutScreenState extends State<AboutScreen> {
  


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
              
            
            Padding(padding: EdgeInsets.all(20), child: Text("O webu", style: TextStyle(color: Colors.white, fontSize: 25),),),
            Padding(padding: EdgeInsets.all(10), child: Text("Vítejte na našem webu, který je vaším průvodcem k úspěšné maturitě z IT! Jsme skupina nadšených studentů ze střední školy, kteří se spojili, aby vám přinesli ucelené a efektivní zdroje pro přípravu na maturitu z informačních technologií.Naše vášeň pro IT nás motivovala k vytvoření tohoto webu, který sdílí bohaté zkušenosti, užitečné tipy a rozsáhlé materiály, které vám pomohou porozumět klíčovým konceptům IT a připravit se na zkoušku s jistotou a sebevědomím. Procházejte naší širokou škálou studijních materiálů, tutoriálů, cvičení a testů, které pokrývají různorodé oblasti IT, od programování a softwarového inženýrství po sítě a databáze. Naše stránky jsou navrženy tak, aby vám usnadnily porozumění složitým konceptům a připravily vás na úspěšné absolvování maturity z IT. Náš tým pracuje neustále na aktualizaci obsahu, abychom vám poskytli aktuální informace a trendy v oblasti informačních technologií. Máme radost, že vás můžeme doprovázet na vaší cestě k dosažení vašich akademických cílů. Děkujeme vám za vaši důvěru a přejeme vám hodně úspěchů při přípravě na maturitu z IT!", 
            style: TextStyle(color: Colors.white),),),
            Padding(padding: EdgeInsets.all(20), child: Text("S láskou: Martin Šaffer, Filip Vávra, Dominik Trávníček, Ondřej Šňupík", style: TextStyle(color: Colors.white),),),
             Padding(padding: EdgeInsets.all(20), child: Text("E-mail: rakketaci@hotmail.com", style: TextStyle(color: Colors.white),),),
          
            ],)
          ),
          )
      ,
    );
  }
}
