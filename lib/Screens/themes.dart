import 'package:flutter/material.dart';
import 'package:quotes_app/utils/themeList.dart';

import '../utils/globals.dart';

class Themes extends StatefulWidget {
  const Themes({super.key});

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(child: Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient:
            RadialGradient(center: Alignment.topLeft, radius: 1,colors: [
              Color(0xff32343b),
              Color(0xff1c1e22),
            ])),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [ Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(child: Icon(Icons.close,color: Colors.white,size: 25,),onTap: () {
                    Navigator.of(context).pop();
                  },),
                  SizedBox(width: width*0.2+30,),

                  Text('Themes',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.w400,
                      fontSize: 20                    ),),
                ],
              ),
            ),
               Padding(
                 padding: const EdgeInsets.only(
                   top: 20,right: 220
                 ),
                 child: Text('Gredients',textAlign:TextAlign.right,style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                             ),),
               ),
              SizedBox(height: height*0.01,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(gredientList.length, (index) =>InkWell(child: buildContainer(height, width,img: gredientList[index]),
                      onTap: () {
                          setState(() {
                            selectedTheme = gredientList[index];
                            Navigator.of(context).pop();
                          });
                        },
                    ), )

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 20,right: 250
                ),
                child: Text('For you',textAlign:TextAlign.right,style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: height*0.01,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(forYouList.length, (index) =>InkWell(child: buildContainer(height, width,img: forYouList[index]),  onTap: () {
                      setState(() {
                        selectedTheme = forYouList[index];
                        Navigator.of(context).pop();
                      });
                    },), )

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20,right: 260
                ),
                child: Text('Nature',textAlign:TextAlign.right,style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: height*0.01,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(natureList.length, (index) =>InkWell(child: buildContainer(height, width,img: natureList[index]), onTap: () {
                      setState(() {
                        selectedTheme = natureList[index];
                        Navigator.of(context).pop();
                      });
                    },), )

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 20,right: 270
                ),
                child: Text('Cute',textAlign:TextAlign.right,style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: height*0.01,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(cuteList.length, (index) =>InkWell(child: buildContainer(height, width,img: cuteList[index]), onTap: () {
                      setState(() {
                        selectedTheme = cuteList[index];
                        Navigator.of(context).pop();
                      });
                    },), )

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 20,right: 240
                ),
                child: Text('Popular',textAlign:TextAlign.right,style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: height*0.01,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(popularList.length, (index) =>InkWell(child: buildContainer(height, width,img: popularList[index]), onTap: () {
                      setState(() {
                        selectedTheme = popularList[index];
                        Navigator.of(context).pop();
                      });
                    },), )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Container buildContainer(double height, double width,{required String img}) {
    return Container(
      margin: EdgeInsets.all(5),
            height: height*0.2,
            width: width*0.3+10,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(img,),
                    fit: BoxFit.cover
                ),
                color: Colors.white70,
                borderRadius: BorderRadius.circular(20)
            ),
          );
  }
}
