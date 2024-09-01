import 'package:flutter/material.dart';
import 'package:mimo/Models/user_model.dart';
import 'package:mimo/Screens/Categories/categories.dart';
import 'package:mimo/Screens/Home/homepage.dart';
import 'package:mimo/Services/user_functions.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController _emailController2 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Create An Account',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
              child: TextField(
                controller: _nameController,
                minLines: 2,
                maxLines: 2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 220, 206, 206))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 220, 206, 206))),
                    hintText: 'Full name',
                    hintStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        shadows: [
                          Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Colors.grey.withOpacity(0.5))
                        ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: _emailController2,
                minLines: 2,
                maxLines: 2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 220, 206, 206))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 220, 206, 206))),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        shadows: [
                          Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Colors.grey.withOpacity(0.5))
                        ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: _passwordController2,
                minLines: 2,
                maxLines: 2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 220, 206, 206))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 220, 206, 206))),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        fontSize: 25,
                        color: const Color.fromARGB(255, 179, 162, 162),
                        fontWeight: FontWeight.w400,
                        shadows: [
                          Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.grey.withOpacity(0.5))
                        ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: _confirmPassword,
                minLines: 2,
                maxLines: 2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 220, 206, 206))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 220, 206, 206))),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                        fontSize: 25,
                        color: const Color.fromARGB(255, 179, 162, 162),
                        fontWeight: FontWeight.w400,
                        shadows: [
                          Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.grey.withOpacity(0.5))
                        ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height * 0.08,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 93, 133, 193),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7))),
                  onPressed: () {
                    var Userdata = User(
                        name: _nameController.text,
                        email: _emailController2.text,
                        password: _passwordController2.text,
                        cnfrmpassword: _confirmPassword.text);
                    addUser(Userdata);
                    print(Userdata);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage()));
                  },
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 252, 250, 250),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.05,
            ),
            Row(
              children: [
                SizedBox(
                  width: mediaQuery.size.width * 0.2,
                ),
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    child: Text(
                      'Log In ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    ))
              ],
            )
          ]),
        ));
  }
}
