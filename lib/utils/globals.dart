import 'package:flutter/material.dart';
import 'package:quotes_app/utils/quoteModel.dart';

int selectedIndex = 0;
bool checkCapital = false,
    checkSmall = false,
    checkSpeChar = false,
    checkDigit = false,
    hideOrNot = false;
bool click=false;
String email = '';
String name = '';
bool value = false;
String pass = '';
bool tickBox = false;
IconData SuffixIcon = Icons.visibility_off;
TextEditingController txtEmail = TextEditingController();
TextEditingController txtPassword = TextEditingController();
TextEditingController txtName = TextEditingController();
GlobalKey<FormState>forkey = GlobalKey();


List <GlobalKey> imgKey = List.generate(quoteModel!.quoteModelList.length,(index) =>GlobalKey());
QuoteModel? quoteModel;

List CategoryList =[];

List categoryName = [
  'Motivation',
  'Perseverance',
  'Courage',
  'Hope',
  'Positivity',
  'Human Nature',
  'Life',
  'Knowledge',
  'Time',
  'Change',
  'Life Lesson',
  'Empowerment',
  'Romantic Love',
  'Self-Love',
  'Love & Kindness',
  'Friendship',
  'Universal Love',
  'Success',
  'Dreams',
  'Knowledge and Learning',
  'Positive Thinking',
];

List<Color> colorList = [

  Colors.blue,
  Colors.grey,
  Colors.amber,
  Colors.white,
  Colors.black,
  Colors.brown,
  Colors.teal,
  Colors.orange,
  Colors.green,
  Colors.deepPurple,
  Colors.cyan,
  Colors.pink,
  Colors.red,
];
Color selectColor = Colors.black;

TextAlign textAlign = TextAlign.center;
List fontFamily = [
  'Caveat',
  'LibreBaskerville',
  'PlaywriteNL',
  'Satisfy',
  'SedanSC',
  'Gruppo',
  'Oswald',
  'Philosopher',

];

var selectedFontFamily = 'SedanSC';
var selectedTheme = '${quoteModel!.quoteModelList[selectedIndex].image!}';