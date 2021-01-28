import 'package:flutter/material.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Counter(),
  ));
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

ArabicNumbers arabicNumber = ArabicNumbers();

class _CounterState extends State<Counter> {
  int counter = 0;
  bool language = true;
  bool numbersStatus = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Center(
            child: Text(
          'المسبحة الإلكترونية',
          style: TextStyle(fontSize: width * .07, fontFamily: "MO_Nawel"),
        )),
        backgroundColor: purpleColor,
      ),
      endDrawer: Drawer(),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: height * .05,
            ),
//(1)upper container
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * .09,
                  width: width * .9,
                  decoration: BoxDecoration(
                    border: Border.all(color: grayColor),
                    borderRadius: BorderRadius.circular(10),
                    color: offWhiteColor,
                  ),
                  child: Center(
                    child: numbersStatus == true
                        ? Text(
                            counter.toString(),
                            style: TextStyle(
                                fontFamily: "digital-7",
                                fontSize: height * .06,
                                color: purpleColor),
                          )
                        : Text(
                            arabicNumber.convert(counter.toString()),
                            style: TextStyle(
                                fontFamily: "digital-7",
                                fontSize: 30,
                                color: purpleColor),
                          ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .04,
            ),
// (2) reset button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    height: height * .08,
                    width: height * .08,
                    decoration: BoxDecoration(
                        color: purpleColor, shape: BoxShape.circle),
                  ),
                  onTap: () {
                    setState(() {
                      counter = 0;
                    });
                  },
                ),
                SizedBox(
                  width: width * .1,
                ),
              ],
            ),
            SizedBox(
              height: height * .04,
            ),
//  (3) main button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120),
                  ),
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Container(
                    height: width * .8,
                    width: width * .8,
                    decoration: BoxDecoration(
                        color: purpleColor, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .04,
            ),
//(4) language and total row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * .01,
                ),
                Container(
                  height: height * .06,
                  padding: EdgeInsets.only(right: 0),
                  child: InkWell(
                    splashColor: whiteColor,
                    onTap: () {
                      setState(() {
                        language = !language;
                        numbersStatus = !numbersStatus;
                        print(language);
                        print(numbersStatus);
                      });
                    },
                    child:
//if language is English
                        language == true
                            ? Container(
                                child: Center(
                                    child: Text(
                                "عربي",
                                style:
                                    TextStyle(color: purpleColor, fontSize: 17),
                              )))
                            //if language is Arabic
                            : Container(
                                child: Center(
                                    child: Text(
                                "English",
                                style:
                                    TextStyle(color: purpleColor, fontSize: 20),
                              ))),
                  ),
                ),
                SizedBox(
                  width: width * .05,
                ),
                Container(
                  width: width * .6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Container(
                            child:
// //if language is English
                                numbersStatus == true
                                    ? Text(
                                        counter.toString(),
                                        style: TextStyle(
                                            fontFamily: "digital-7",
                                            fontSize: 20,
                                            color: purpleColor),
                                      )

                                    //if language is English

                                    : Text(
                                        arabicNumber
                                            .convert(counter.toString()),
                                        style: TextStyle(
                                            fontFamily: "digital-7",
                                            fontSize: 20,
                                            color: purpleColor),
                                      )),
                      ),
                      Text(
                        language == true ? "      Total" : " :مجموع التسبيحات",
                        style: TextStyle(
                            fontFamily: "MO_Nawel",
                            fontSize: 20,
                            color: grayColor),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

const whiteColor = Color(0xFFEEEEEE);
const offWhiteColor = Color(0xFFFBFAFE);
const purpleColor = Color(0xFF6A55A6);
const grayColor = Color(0xFFB7B6B9);
