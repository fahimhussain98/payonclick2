// import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:payoneclick/Drawer/MyCustomDrawer.dart';
import 'package:url_launcher/url_launcher.dart';

class SuppordScreen extends StatefulWidget {
  const SuppordScreen({super.key});

  @override
  State<SuppordScreen> createState() => _SuppordScreenState();
}

class _SuppordScreenState extends State<SuppordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Stack(children:[
                Image.asset('image/circleForDrawer.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 7,top: 5),
                  child: Icon(Icons.sort,color: Colors.white,size: 25,),
                )
              ]),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Center(
          child: Row(
              children:[
                Image.asset(
                  'image/icon2.png',
                  width: 200,
                ),
                Spacer(),
                Container(
                  width: 40, // Adjust the width of the container
                  height: 40, // Adjust the height of the container
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // This makes the container circular
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.red, // Set the color of the border
                      width: 2, // Set the width of the border
                    ),// Set the background color of the container
                  ),
                  child: Center(
                    child: Icon(
                      Icons.question_mark, // Specify the icon you want to display
                      color: Colors.blue[300], // Set the color of the icon
                      size: 25, // Adjust the size of the icon
                    ),
                  ),
                )




              ]
          ),
        ),
      ),
      drawer: MyCustomDrawer(),
     body: Stack(
    children: [
    //this si background image
    Image.asset(
      "image/ProfileWI.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      ),
    Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          margin: EdgeInsets.only(top: 90),
          color:   Color(0xff046DB5),
          child: Align(child: Text("Contact Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(40),
          //   color: Colors.white,
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey.withOpacity(0.5),
          //       spreadRadius: 5,
          //       blurRadius: 7,
          //       offset: Offset(0, 3), // changes position of shadow
          //     ),
          //   ],
          // ),
        ),
        SizedBox(height: 10,),
        //this is simple line with color
        Container(
          height: 9,
          width: double.infinity,
          color:   Color(0xff046DB5),
        ),
        SizedBox(height: 5,),


        Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.only(top: 15,left: 15,right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.location_on,
                  color:   Color(0xff0361A2), //0361A2
                  size: 30, // You can adjust the size of the icon
                ),
              ),
              Expanded(
                child: SingleChildScrollView(


                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Kharian, Near Baba Munganath Temple, Sirsa(125076) ",
                      style: TextStyle(fontSize: 16),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),

        Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.only(top: 15,left: 15,right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child:InkWell(
            onTap: (){
              callnumber();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.wifi_calling_3,
                    color:   Color(0xff0361A2), //0361A2
                    size: 30, // You can adjust the size of the icon
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "+91 9992688080",
                    style: TextStyle(fontSize: 16),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 5,),


        Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.only(top: 15,left: 15,right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Image.asset("image/wattsappIcon.png",height: 30,width: 30,color: Color(0xff0361A2),)
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: InkWell(
                  onTap: () {
                    WatsappBtn();
                  },
                  child: Text(
                    "+919992688080",
                    style: TextStyle(fontSize: 16),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),

        Container(

          height: 60,
          width: double.infinity,
          margin: EdgeInsets.only(top: 15,left: 15,right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Image.asset("image/EmailIcon.png",height: 30,width: 30,color: Color(0xff0361A2),)
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: InkWell(
                  onTap: () {
                    launchEmail();
                  },
                  child: Text(
                    "contactus@payonclick.in",
                    style: TextStyle(fontSize: 16),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),

        Container(

          height: 60,
          width: double.infinity,
          margin: EdgeInsets.only(top: 15,left: 15,right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Image.asset("image/websiteIcon.png",height: 30,width: 30,color: Color(0xff0361A2),)
              ),
              InkWell(
                onTap: () {
                  launchWebsite();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "www.payonclick.in/",
                    style: TextStyle(fontSize: 16),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),



      ]),
      //don't go outside the stack
    ],),

    );
  }
  //____________this is call methode________
  Uri dialnumber = Uri(scheme: 'tel',path: '9992688080');
  callnumber()async{
    await launchUrl(dialnumber);
  }
  dialcall()async{
    await FlutterPhoneDirectCaller.callNumber('9992688080');
  }
  //_________function WatsappBtn_________
  Future<void> WatsappBtn() async {
    var contact = "+919992688080";
    var androidUrl = Uri.parse("whatsapp://send?phone=$contact&text=${Uri.encodeComponent("I Need some help")}");
    var iOSUrl = Uri.parse("https://wa.me/$contact?text=${Uri.encodeComponent("Hi, I Need some help")}");

    if (Platform.isIOS) {
      if (await canLaunchUrl(iOSUrl)) {
        await launchUrl(iOSUrl, mode: LaunchMode.externalApplication);
      } else {
        print("iOS WhatsApp is not installed");
      }
    } else {
      if (await canLaunchUrl(androidUrl)) {
        await launchUrl(androidUrl, mode: LaunchMode.externalApplication);
      } else {
        print("Android WhatsApp is not installed");
      }
    }
  }
//_________function gmail_________
  void launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'contactus@payonclick.in',
      query: 'subject=Need Help&body=Hi, I need some help with...', // Add subject and body here if needed
    );

    final url = params.toString();
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      print('Could not launch $url');
    }
  }
//_________function website_________
  void launchWebsite() async {
    const url = 'https://www.payonclick.in/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }








}
