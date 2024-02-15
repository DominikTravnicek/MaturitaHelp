import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegistrationScreen;
  const LoginScreen({Key? key, required this.showRegistrationScreen})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var error = "";

  Future signIn() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Opacity(
                opacity: 0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffC83838),
                  ),
                ));
          });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        error = 'Nenašel se uživatel pro tento E-mail';
      } else if (e.code == 'wrong-password') {
        error = 'Bylo zadáno špatné heslo';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: const EdgeInsets.all(16),
              height: 90,
              decoration: const BoxDecoration(
                  color: Color(0xffC83838),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Jejda!", style: TextStyle(fontSize: 22)),
                    Text(" $error", style: const TextStyle(fontSize: 16)),
                  ]))));
      error = "";
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff383961),
      body: SafeArea(
        
        child:Center( 
        child:Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: const Color(0xffD1B1CB),),
              alignment: Alignment.center,
              
              width: 500,
              child:Column(
                children:[
            Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only( top: 30),
            child: const Text(
              'Přihlašte se',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 26,
                color: Color(0xff4A4A48),
                fontWeight: FontWeight.bold,
              ),
            ),
            
          ),
          //email
          Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: TextField(
              style: const TextStyle(color: Color(0xff4A4A48)),
              controller: emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff2A3044)),
                  borderRadius: BorderRadius.circular(35),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: 'Email',
                hintStyle: const TextStyle(color: Color(0xff4A4A48)),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: TextField(
              style: const TextStyle(color: Color(0xff4A4A48)),
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff4A4A48)),
                  borderRadius: BorderRadius.circular(35),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: 'Heslo',
                hintStyle: const TextStyle(color: Color(0xff4A4A48)),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          
          //button
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: GestureDetector(
                onTap: signIn,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xff4A4A48),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Center(
                    child: Text(
                      'Přihlásit se',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Ještě nemáte účet?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4A4A48),
                  fontSize: 16),
            ),
            GestureDetector(
              onTap: widget.showRegistrationScreen,
              child: const Text(
                ' Zaregistrujte se',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4A4A48),
                    fontSize: 16),
              ),
            ),
          ]),
          
        ]))],
          )),
    ));

  }
  }

