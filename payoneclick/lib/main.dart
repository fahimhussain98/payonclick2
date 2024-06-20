import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/Api_models/Login_Model.dart';
import 'package:payoneclick/TabBar/DTH_BrowsePlan/DTH_browsePlan.dart';
import 'package:payoneclick/TabBar/DTH_BrowsePlan/DTH_browsePlanForSundirct.dart';
import 'package:payoneclick/screens/Loginpage.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginModel = LoginModel(); // You should replace this with actual initialization


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: HomePage(),
      home: Loginpage(), //correct
     //   home:home()
      // home: operatorscreen(),
      //home: operatorscreen2(),
     // home:  NavBar(),
    //  home: splashScreen(), //this is ready page.
     // home: AirtelScreen(),
     // home: JioScreen(loginModelData: loginModel ,showStateTextField: true,),

     // home: walletScreen(),
      //home: ProfilleScreen(),
      //home: SuppordScreen(),
      //home:ReportScreen(),
      //  home: RechargeReportScreen(),
      //  home:RechargeTransactionSlip()
     //   home: Testingpage(),
    //  home: Testingpage2(),


      // showStateTextField: true,),
    //  home: MobileRechargeTabBar(title: "Your Plans",userID: "AhCtz8JqpO5ZZSAo4QSneFunsKFHQMXB",dropdownValue2: "Reliance Jio",selectedState: "Delhi NCR",),
    //  home: TopUp(userID: "AhCtz8JqpO5ZZSAo4QSneFunsKFHQMXB",dropdownValue2: "VI",selectedState: "Delhi NCR",),
     // home: MobileChargeMyPlanTabBar(title: 'My Plan',userID: "AhCtz8JqpO6lmo+yME0q5VunsKFHQMXB",dropdownValue2: "VI",mobileNumber: 9643159919,),


    //  home: fullTT(userID: "AhCtz8JqpO5ZZSAo4QSneFunsKFHQMXB",dropdownValue2: "Reliance Jio",selectedState: "Delhi NCR",),
    //  home: DthBrowsePlan(),
   //   home:DthBrowsePlanSundirectg(userID: 'AhCtz8JqpO6IkDSupQR/p1unsKFHQMXB', dropdownValue2: 'sundirect',subscribeIDcontroller:'8448505251'),

    );
  }
}
