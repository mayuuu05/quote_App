import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/utils/quoteList.dart';

import '../utils/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  void initState() {
    setState(() {});
    super.initState();
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient:
                RadialGradient(center: Alignment.topLeft, radius: 1, colors: [
              Color(0xff32343b),
              Color(0xff1c1e22),
            ]),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:() {

                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Text(
                        'Categories',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 25,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    // Random random = Random();
                    // int x = random.nextInt(quoteModel!.quoteModelList.length);
                    Navigator.of(context).pushNamed('/view');
                  },
                  child: Container(
                    height: height * 0.08,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                        color: const Color(0xff30343A),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: const Text(
                      'All  Categories',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Wrap(
                  children: [
                    ...List.generate(categoryName.length,(index) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              CategoryList.clear();
                              for (int i = 0; i < quoteList.length; i++) {
                                if (categoryName[index] ==
                                    quoteList[i]['cat']) {
                                  CategoryList.add(quoteList[i]);
                                }
                              }
                              Navigator.of(context).pushNamed('/view');
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: height * 0.08,
                                width: width * 0.4+10,
                                decoration: BoxDecoration(
                                    color: const Color(0xff30343A),
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child:  Text(
                                  '${categoryName[index]}',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),

                      ],
                    ), )

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
