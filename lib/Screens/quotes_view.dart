import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/Screens/editingPage.dart';
import 'package:share_extend/share_extend.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_extend/share_extend.dart';

import '../utils/globals.dart';
import '../utils/quoteList.dart';
import '../utils/quoteModel.dart';
 import 'dart:ui' as ui ;
class QuotesView extends StatefulWidget {
  const QuotesView({super.key});

  @override
  State<QuotesView> createState() => _QuotesViewState();
}

class _QuotesViewState extends State<QuotesView> {
  void initState() {
    setState(() {});
    quoteModel = QuoteModel.toList((CategoryList.isEmpty) ? quoteList : CategoryList);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          PageView(
              scrollDirection: Axis.vertical,
              children:List.generate( quoteModel!.quoteModelList.length,(index) =>
          InkWell(
            onTap: () {
              selectedIndex=index;
            },
            child: RepaintBoundary(
              key: imgKey[index],
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    gradient:
                    RadialGradient(center: Alignment.topLeft, radius: 1,colors: [
                      Color(0xff32343b),
                      Color(0xff1c1e22),
                    ]),
                    image: DecorationImage(

                        image: AssetImage(quoteModel!.quoteModelList[index].image!,),
                        fit: BoxFit.cover
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40,
                      right: 30
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText(
                        cursorColor: Colors.black,

                        "${quoteModel!.quoteModelList[index].quote!}\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),

                      Text("- ${quoteModel!.quoteModelList[index].author!} -",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                        ),),


                    ],
                  ),
                ),
              ),
            ),
          ),),

          ),


          Padding(
            padding: const EdgeInsets.only(
                top: 700
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap:() {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      height: height*0.06,
                      width: width*0.1+20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon( CupertinoIcons.square_grid_2x2_fill,color: Colors.black,weight: 150,)),
                ),
                InkWell(
                  onTap:() {

                    Navigator.of(context).pushNamed('/theme');
                  },
                  child: Container(
                      height: height*0.06,
                      width: width*0.1+20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon( CupertinoIcons.paintbrush_fill,color: Colors.black,weight: 150,)),
                ),
                ...List.generate(1,(index) =>
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit');
                    },
                    child: Container(
                        height: height*0.06,
                        width: width*0.1+20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon( CupertinoIcons.text_cursor,color: Colors.black,weight: 150,)),
                  ),
                ),
                ...List.generate(1,(index) =>
                  GestureDetector(

                    onTap: () async {
                      showDialog(context: context, builder: (BuildContext context){
                        return CupertinoAlertDialog(
                          title: Text("Do you want to save image?"),

                          actions: [
                            CupertinoDialogAction(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:  Text(
                                    'Saved successfully',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Navigator.of(context).pop();
                            }, child: Text("Save",style: TextStyle(
                                color: Colors.black
                            ),)),

                            CupertinoDialogAction(onPressed: (){
                              Navigator.of(context).pop();
                            }, child: Text("Cancle",style: TextStyle(
                                color: Colors.red

                            ),)),

                          ],
                          // content: Text("Saved successfully"),
                        );
                      });
                      RenderRepaintBoundary boundary = imgKey[selectedIndex]
                          .currentContext!
                          .findRenderObject()
                      as RenderRepaintBoundary;

                      ui.Image image = await boundary.toImage();
                      ByteData? bytedata = await image.toByteData(
                          format: ui.ImageByteFormat.png);
                      Uint8List img =
                      bytedata!.buffer.asUint8List();
                      ImageGallerySaver.saveImage(img);
                      // Navigator.pop(context);
                    },

                    child: Container(
                        height: height*0.06,
                        width: width*0.1+20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon( Icons.save_alt,color: Colors.black,weight: 150,)),
                  ),
                ),
                ...List.generate(1,(index) =>
                    GestureDetector(
                      onTap: () async {
                        RenderRepaintBoundary boundary =
                        imgKey[selectedIndex].currentContext!.findRenderObject()
                        as RenderRepaintBoundary;

                        ui.Image image = await boundary.toImage();
                        ByteData? bytedata = await image.toByteData(
                            format: ui.ImageByteFormat.png);
                        Uint8List img = bytedata!.buffer.asUint8List();

                        final path = await getApplicationDocumentsDirectory();
                        File file = File("${path.path}/img.png");
                        file.writeAsBytes(img);
                        ShareExtend.share(file.path, "image");
                      },
                      child: Container(
                          height: height*0.06,
                          width: width*0.1+20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon( Icons.share,color: Colors.black,weight: 150,)),
                    ),
                ),

              ],
            ),
          )

        ]
      ),

    ),);
  }
}
