import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/utils/quoteList.dart';
import 'package:share_extend/share_extend.dart';

import 'dart:ui' as ui;
import '../utils/globals.dart';

class EditingPage extends StatefulWidget {
  const EditingPage({super.key});

  @override
  State<EditingPage> createState() => _EditingPageState();
}
GlobalKey editimgKey = GlobalKey();
class _EditingPageState extends State<EditingPage> {
  int _currentIndex = 0;

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
          ]),
        ),
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
                     Icons.close,
                     color: Colors.white,
                     size: 25,
                   ),
                 ),
                 Text(
                   'Edit',
                   style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w400,
                       fontSize: 20),
                 ),
                 ...List.generate(1,(index) =>
                     IconButton(onPressed: () {
                       Clipboard.setData(ClipboardData(
                           text: quoteList[selectedIndex]['quote']));
                     }, icon:Icon(Icons.copy,color: Colors.white,)),
                 ),
               ],
             ),
           ),
           SizedBox(
             height: height * 0.02,
           ),

           RepaintBoundary(
             key: editimgKey,
             child: Container(
               height: height*0.7,
               width: width*0.9,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white70,
                   image: DecorationImage(
                       image: AssetImage(selectedTheme,),
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

                       "${quoteModel!.quoteModelList[selectedIndex].quote!}\n",textAlign: textAlign,
                       style: TextStyle(

                           color: selectColor,
                           fontWeight: FontWeight.bold,
                           fontSize: 20,

                         fontFamily: selectedFontFamily,
                       ),

                     ),

                     Text("- ${quoteModel!.quoteModelList[selectedIndex].author!} -",textAlign: textAlign,
                       style: TextStyle(
                           color: selectColor,
                           fontFamily: selectedFontFamily,
                           fontSize: 17
                       ),),


                   ],
                 ),

               ),

             ),
           )
         ],
       ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex =index;
          });
        },
        // currentIndex: 3s,
        items:  [
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) => Container(
                    height: height*0.5,
                   width: width,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Text align',
                             style: TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18)),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             InkWell(
                               onTap: () {
                                 setState(() {
                                   textAlign = TextAlign.left;
                                 });
                               },
                               child: Icon(
                                 CupertinoIcons.text_alignleft,
                                 color: Colors.black,
                                 size: 32,
                               ),
                             ),
                             InkWell(
                               onTap: () {
                                 setState(() {
                                   textAlign = TextAlign.justify;
                                 });
                               },
                               child: Icon(
                                 CupertinoIcons.text_justify,
                                 color: Colors.black,
                                 size: 32,
                               ),
                             ),
                             InkWell(
                               onTap: () {
                                 setState(() {
                                   textAlign = TextAlign.center;
                                 });
                               },
                               child: Icon(
                                 CupertinoIcons.text_aligncenter,
                                 color: Colors.black,
                                 size: 32,
                               ),
                             ),
                             InkWell(
                               onTap: () {
                                 setState(() {
                                   textAlign = TextAlign.right;
                                 });
                               },
                               child: Icon(
                                 CupertinoIcons.text_alignright,
                                 color: Colors.black,
                                 size: 32,
                               ),
                             ),

                           ],
                         ),
                         Text('Font colors',
                             style: TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18)),
                         SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                             children: [
                               ...List.generate(
                                 colorList.length,
                                     (index) => GestureDetector(
                                   onTap: () {
                                     setState(() {
                                       selectColor = colorList[index];
                                     });
                                     // Navigator.of(context).pushNamed('/de');
                                   },
                                   child: Container(
                                     margin: EdgeInsets.only( right: 12),
                                     height: height*0.05,
                                     width: width*0.1,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: colorList[index],
                                       border: Border.all(
                                         color: Colors.black
                                       )
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 2,bottom: 10),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Font style',
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18)),
                               SingleChildScrollView(
                                 scrollDirection: Axis.horizontal,
                                 child: Row(
                                   children: [
                                     ...List.generate(
                                       fontFamily.length,
                                           (index) => Padding(
                                         padding: const EdgeInsets.only(right: 10,top: 10),
                                         child: GestureDetector(
                                           onTap: () {
                                             setState(() {
                                               selectedFontFamily = fontFamily[index];
                                             });
                                             // Navigator.of(context).pushNamed('/de');
                                           },
                                           child: Container(
                                             height: height*0.05,
                                             width: width*0.2,
                                             decoration: BoxDecoration(
                                               color: Colors.transparent,
                                               border: Border.all(
                                                 color: Colors.black
                                               ),
                                               borderRadius: BorderRadius.circular(10),
                                             ),
                                             alignment: Alignment.center,
                                             child: Text(
                                               'abc',
                                               overflow: TextOverflow.ellipsis,
                                               style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 20,
                                                   fontFamily: '${fontFamily[index]}'),
                                             ),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                  ),);
                },
                child: Icon(CupertinoIcons.text_cursor), ),
            label:'Text',
            tooltip: AutofillHints.addressState,
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(icon: InkWell(child: Icon(CupertinoIcons.paintbrush_fill),onTap: () {
            Navigator.of(context).pushNamed('/theme');
          },),
              label: 'Theme',
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(icon:  GestureDetector(
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
              RenderRepaintBoundary boundary = editimgKey
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
            child: Icon(
              Icons.save_alt_outlined,
              size: 25,
            ),
          ),
              label: 'Save',
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(icon: InkWell(child: Icon(Icons.wallpaper),onTap: () async {
            RenderRepaintBoundary
            boundary = editimgKey
                .currentContext!
                .findRenderObject()
            as RenderRepaintBoundary;

            ui.Image image =
            await boundary.toImage();
            ByteData? bytedata =
            await image.toByteData(
                format: ui
                    .ImageByteFormat
                    .png);
            Uint8List img = bytedata!
                .buffer
                .asUint8List();

            final path =
            await getApplicationDocumentsDirectory();
            File file = File(
                "${path.path}/img.png");
            file.writeAsBytes(img);

            int location = WallpaperManager
                .BOTH_SCREEN; //can be Home/Lock Screen
            bool result =
            await WallpaperManager
                .setWallpaperFromFile(
                file.path,
                location);
          },),
              label: 'Wallpaper',
              backgroundColor: Colors.black
          ),

          BottomNavigationBarItem(icon: InkWell(child: Icon(Icons.share),
            onTap: () async {
              RenderRepaintBoundary boundary =
              editimgKey.currentContext!.findRenderObject()
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
          ),

              label: 'Share',
              backgroundColor: Colors.black
          ),

        ],
      ),
    ));
  }
}
