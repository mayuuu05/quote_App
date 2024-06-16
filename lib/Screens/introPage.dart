import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/utils/globals.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width * double.infinity,
        height: height * double.infinity,
        decoration: BoxDecoration(
          // image: DecorationImage(image: AssetImage('assets/images/bg.jpeg')),
          gradient:
              RadialGradient(center: Alignment.topLeft, radius: 1, colors: [
            Color(0xff32343b),
            Color(0xff1c1e22),
          ]),

        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            child: PageView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    SizedBox(height: height*0.2-30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 35,
                            color: Colors.white),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 40,
                        right: 40,
                        top: 20
                      ),
                      child: Text(
                        '    Discover thousands of quotes from great minds,organized by themes to uplift your spirit\n                 and spark your creativity. ',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            // fontWeight: FontWeight.w700,
                              fontSize: 12,
                              wordSpacing: 1,
                              color: Colors.white),
                        )

                      ),
                    ),
                    SizedBox(height: height*0.3+5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.1-50,),
                    Image.asset('assets/images/Group 20.png',),

                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/in 1.png',),
                    SizedBox(height: height*0.1+30,),
                    Icon(Icons.format_quote,color: Colors.white70,size: 40,),
                    SizedBox(height: height*0.05,),
                    Text(
                      'Mindmystery  has the perfect words \n            for every occasion. ',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.white),
                      )

                    ),
                    SizedBox(height: height*0.2+20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.03,),
                    Container(
                      height: height*0.05,
                      width: width*0.2,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(13)
                      ),
                      child: Icon(Icons.arrow_forward,color: Colors.white24,),
                    )

                  ],
                ),
                Column(
                  children: [
                    // Image.asset('assets/images/Group 27.png',),
                    SizedBox(height: height*0.1+30,),
                    Icon(Icons.format_quote,color: Colors.white70,size: 40,),
                    SizedBox(height: height*0.05,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                          'Really Epic Quotes That Makes \n              Everyone Think. ',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 17,
                                color: Colors.white),
                          )

                      ),
                    ),

                    SizedBox(height: height*0.1+50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.03,),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 40
                      ),
                      height: height*0.05,
                      width: width*0.2,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(13)
                      ),
                      child: Icon(Icons.arrow_forward,color: Colors.white24,),
                    ),
                    Image.asset('assets/images/in 4.png',),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/logo.png',height: 250,),
                    Text(
                        'Dive in and let the power of words \n             transform your day!',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white),
                        )
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: height*0.03,),
                    GestureDetector(
                      onTap: (){
                       Navigator.of(context).pushNamed('/login');
                      },
                      child: Container(
                        height: height*0.07-5,
                        width: width*0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white
                        ),
                        alignment: Alignment.center,
                        child: const Text('Dive in',style: TextStyle(
                            color:Color(0xff1c1e22),
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
