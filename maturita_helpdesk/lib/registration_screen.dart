import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const RegistrationScreen({Key? key, required this.showLoginScreen})
      : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final nickController = TextEditingController();
  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String uid;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }
  Future addUserDetails() async {
    User user = auth.currentUser!;
    
    
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      
      'nick':nickController.text,
      
    });
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      try {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xffC83838),
                ),
              );
            });
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        addUserDetails();
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (e) {
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
                      const Text("Někde nastala chyba :(",
                          style: const TextStyle(fontSize: 16)),
                    ]))));
      }
    } else {
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
                    const Text("Hesla se neshodují",
                        style: const TextStyle(fontSize: 16)),
                  ]))));
    }
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth= MediaQuery.of(context).size.width;
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
              'Zaregistrujte se',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 26,
                color: Color(0xff4A4A48),
                fontWeight: FontWeight.bold,
              ),
            ),
            
          ),
          
          
          Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: TextField(
              style: const TextStyle(color: Color(0xff4A4A48)),
              controller: nickController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff2A3044)),
                  borderRadius: BorderRadius.circular(35),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: 'Přezdívka',
                hintStyle: const TextStyle(color: Color(0xff4A4A48)),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
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

          // confirm password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: TextField(
              style: const TextStyle(color: Color(0xff4A4A48)),
              controller: confirmpasswordController,
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
                hintText: 'Potvrďte Heslo',
                hintStyle: const TextStyle(
                  color: Color(0xff4A4A48),
                ),
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
                onTap: signUp,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xff4A4A48),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Center(
                    child: Text(
                      'Zaregistrovat se',
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
              'Už u nás máte účet?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4A4A48),
                  fontSize: 16),
            ),
            GestureDetector(
              onTap: widget.showLoginScreen,
              child: const Text(
                ' Přihlašte se',
                style: TextStyle(
                    decoration: TextDecoration.underline,
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
