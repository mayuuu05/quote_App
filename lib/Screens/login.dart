import 'package:flutter/material.dart';

import '../utils/globals.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body:  Form(
        key: forkey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient:
              RadialGradient(center: Alignment.topLeft, radius: 1,colors: [
                Color(0xff32343b),
                Color(0xff1c1e22),
              ])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height*0.1-30,
                ),
                Image.asset('assets/images/vector.png',height: 130,),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Colors.white),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20
                  ),
                  child: Text('Please fill the input blow here ',style: TextStyle(
                    color:Colors.white70,
                    fontSize:10,

                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15,
                      right: 15
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return "Field Must be Filled";
                      }

                    },
                    cursorColor: Colors.white70,
                    style: TextStyle(
                        color: Colors.white
                    ),
                    keyboardType: TextInputType.emailAddress,
                    // controller: txtName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white70,
                        size: 25,
                      ),
                      label: Text('Name'),
                      labelStyle: TextStyle(
                          color: Colors.white24
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.red,  width: 0.5)
                      ),

                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide:
                          BorderSide(color: Colors.white70,  width: 0.5)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide:
                        BorderSide(color: Colors.white70, width: 0.5),
                      ),
                    ),

                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15,
                      right: 15
                  ),
                  child: TextFormField(
                    validator: (value) {

                      bool checkCapital = false;
                      bool checkSpeChar = false;
                      if (value!.isEmpty) {
                        return 'Enter an email or phone number !';
                      } else if (!value.contains('@gmail.com')) {
                        return 'Enter Perfect gmail including "@gmail.com" !';
                      } else if (value.contains(' ')) {
                        return 'Space is not Allow !';
                      } else if (value.length <= 10) {
                        return 'Enter valid e-mail or phone number';
                      }
                      for (int i = 0; i < value.length; i++) {
                        if (value[i] != value[i].toLowerCase()) {
                          checkCapital = true;
                        }
                      }
                      if (checkCapital) {
                        return 'Capital Letter is not Allow !';
                      }
                      for (int i = 0; i < value.length; i++) {
                        int charCode = value.codeUnitAt(i);
                        if ((charCode >= 32 && charCode <= 45) ||
                            (charCode == 47) ||
                            (charCode >= 58 && charCode <= 63) ||
                            (charCode >= 91 && charCode <= 96) ||
                            (charCode >= 123 && charCode <= 126)) {
                          checkSpeChar = true;
                        }
                      }
                      if (checkSpeChar) {
                        return 'Special character is not Allow !';
                      }
                    },
                    textInputAction: TextInputAction.next,
                    // controller: txtEmail,
                    cursorColor: Colors.white70,
                    style: TextStyle(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white70,
                          size: 25,
                        ),
                        label: Text('Email'),
                        labelStyle: TextStyle(
                            color: Colors.white24
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            borderSide:
                            BorderSide(color: Colors.white70, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide:
                          BorderSide(color: Colors.white70, width: 0.5),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                            BorderSide(color: Colors.red, width: 0.5)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15,
                      right: 15
                  ),
                  child: TextFormField(

                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return "password must be required";
                      }
                      if(value!.length<=8)
                      {
                        return 'Password must be 8 characters';
                      }

                    },
                    obscureText:  true,
                    cursorColor: Colors.white70,
                    style: TextStyle(
                        color: Colors.white
                    ),
                    keyboardType: TextInputType.emailAddress,
                    // controller: txtPassword,

                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.fingerprint,
                          color: Colors.white70,
                          size: 25,
                        ),
                        label: Text('Password'),
                        labelStyle: TextStyle(
                            color: Colors.white24
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                            BorderSide(color: Colors.red, width: 0.5)
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            borderSide:
                            BorderSide(color: Colors.white70, width: 0.5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide:
                          BorderSide(color: Colors.white70, width: 0.5),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                              right: 10
                          ),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  tickBox = !tickBox;
                                  if(tickBox)
                                  {
                                    SuffixIcon = Icons.visibility_off;
                                  }
                                  else
                                  {
                                    SuffixIcon = (Icons.visibility);
                                  }
                                });
                              },
                              child: Icon(Icons.visibility_off,color: Colors.white70,size: 25,)),
                        )),

                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password ?   ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height*0.05,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // click = !click;
                      bool response = forkey.currentState!.validate();
                      if(response)
                      {
                        pass = txtPassword.text;
                        email = txtEmail.text;
                        name = txtName.text;
                        Navigator.of(context).pushNamed('/home');
                      }
                      if(forkey.currentState!.validate())
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:  Text(
                              'Account Created Successfuly!',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }
                    });

                    // Navigator.of(context).pushNamed('/home');
                  },
                  child: Container(
                    height: height*0.07-5,
                    width: width*0.6,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                  ),
                ),
                SizedBox(
                  height: height*0.09,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/home');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:  Text(
                          'Welcome to Mindmystrey',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Continue As Guest',style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize:17
                  ),),
                ),
                SizedBox(height: height*0.01,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account ? ',style: TextStyle(
                      color:Colors.white70,
                      fontSize:15,

                    ),),
                    Text('Sign in',style: TextStyle(
                        color:Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize:15
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
