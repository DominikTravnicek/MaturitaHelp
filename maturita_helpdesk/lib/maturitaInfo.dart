

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
          SingleChildScrollView(
            child: Container(
              constraints:BoxConstraints(
                minHeight: 200,
                                          maxWidth: 700,
              ),
              child: Column(
                children: [
                  Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Registrace a Podmínky účasti: Studenti musejí být registrováni k účasti na maturitní zkoušce. Obvykle musí splňovat určité podmínky týkající se absolvování určitých kurzů nebo předmětů během středoškolského studia. ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                
              
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Termíny a Rozvržení: Maturity se obvykle konají v určitých termínech každý rok. Studenti jsou informováni o datech a časech jejich zkoušek. ",
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
                      "Předměty a Testování: Studenti jsou zkoušeni z různých předmětů včetně matematiky, češtiny, cizích jazyků, vědy, dějepisu, literatury atd. Formát zkoušek se může lišit, ale obvykle zahrnuje písemné testy, ústní zkoušky a praktické zkoušky v některých případech. ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Písemné zkoušky: Písemné zkoušky jsou obvykle strukturované a zahrnují různé typy otázek, včetně otázek s výběrem odpovědi, krátkých odpovědí a rozsáhlejších eseji. Studenti musí prokázat své znalosti a schopnosti v rámci daných předmětů.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Ústní zkoušky: Některé zkoušky mohou zahrnovat ústní část, kde jsou studenti testováni na své komunikační schopnosti, analytické dovednosti a hloubku porozumění předmětu. ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Praktické zkoušky: V některých případech mohou být požadovány praktické zkoušky, zejména pokud jde o umělecké předměty, technické dovednosti nebo jiné oblasti, ve kterých je důležité demonstrovat praktické dovednosti. Vyhodnocení a Hodnocení: Zkoušky jsou hodnoceny a studenti obdrží výsledky, které mohou být zveřejněny. V mnoha případech jsou také poskytovány hodnocení v jednotlivých předmětech. ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Vyhodnocení a Hodnocení: Zkoušky jsou hodnoceny a studenti obdrží výsledky, které mohou být zveřejněny. V mnoha případech jsou také poskytovány hodnocení v jednotlivých předmětech. ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Absence a Opravné zkoušky: Existují určitá pravidla týkající se absence ze zkoušek a možnosti opravných zkoušek pro studenty, kteří neuspěli při prvním pokusu. ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Způsobilost k Vysokoškolskému Studiu: Výsledky maturitní zkoušky mohou být klíčovým faktorem pro přijetí na vysokou školu. Studenti musejí obvykle dosáhnout určitého minimálního průměru výsledků nebo splnit další požadavky, aby byli přijati na vysokoškolské studium. ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Bezpečnostní a Integritní Pravidla: Během zkoušek musejí studenti dodržovat určitá pravidla týkající se podvádění a narušování zkoušek, aby zajišťovali spravedlivé a důvěryhodné prostředí pro všechny zúčastněné. Je důležité, aby studenti a učitelé byli dobře informováni o všech předpisech a požadavcích týkajících se maturitních zkoušek, aby mohli úspěšně absolvovat tuto důležitou fázi svého středoškolského vzdělání. ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ],),
            )
          )
        
      )
      ,
    );
  }
}
