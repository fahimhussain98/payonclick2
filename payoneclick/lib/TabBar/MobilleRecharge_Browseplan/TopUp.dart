import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/MobileRechargeBrowsePlan%20Model/BrowsePlanModel.dart';


class TopUp extends StatefulWidget {
  final String userID;
  final String? selectedState;
  final String? dropdownValue2; // this holds operator name

  const TopUp({
    super.key,
    required this.userID,
    this.selectedState,
    this.dropdownValue2,
  });

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp>with SingleTickerProviderStateMixin {
  BrowsePlanModel? browsePlan;   //this is model for the "airtel mainly"
  String? errorMessage;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    fetchBrowsePlan();        //this is model for the "airtel mainly"
    print(widget.userID);
  }

  Future<void> fetchBrowsePlan() async {
    ApiServices apiServices = ApiServices();
    var result1 = await apiServices.getBrowsePlan(
    widget.userID,
    widget.dropdownValue2 ?? "VI",
    widget.selectedState ?? "Delhi",
    );
    setState(() {
       browsePlan = result1; //basically model ke data ko access kr rha hai
       if(result1 == null){
        errorMessage = 'Failed to load data of the brosePlan which is basically BrowsePlanModel';
     }else{
         _tabController = TabController(
         length: _getbrowsemodeldata().length,
          vsync: this);
           }
      });
  }
  List<Map<String, dynamic>> _getbrowsemodeldata(){
    List<Map<String, dynamic>> tabs = [];
    if(browsePlan?.data?.records?.topup?.isNotEmpty ?? false){
      tabs.add({'title': 'TopUp','plans': browsePlan?.data?.records?.topup});
    }

    if(browsePlan?.data?.records?.threeGFourG?.isNotEmpty ?? false){
      tabs.add({'title': '3G/4G','plans': browsePlan?.data?.records?.threeGFourG});
    }
    if(browsePlan?.data?.records?.romaing?.isNotEmpty ?? false){
      tabs.add({'title': 'roaming','plans': browsePlan?.data?.records?.romaing});
    }
    if(browsePlan?.data?.records?.combo?.isNotEmpty ?? false){
      tabs.add({'title': 'Combo','plans': browsePlan?.data?.records?.combo});
    }
    if(browsePlan?.data?.records?.msg?.isNotEmpty ?? false){
      tabs.add({'title': 'Msg','plans': browsePlan?.data?.records?.msg});
    }
    return tabs;

  }


  @override
  Widget build(BuildContext context) {
    var availableTAb = _getbrowsemodeldata();
    return Scaffold(
      appBar: AppBar(
        title: Text("Combo Offers"),
        bottom: _tabController != null
            ? TabBar(
          controller: _tabController,
          tabs: availableTAb.map((tab) => Tab(text: tab['title'])).toList(),
        )
            : null,
      ),
      body: Center(
        child: browsePlan == null
            ? Container(
          child: Center(
            child: Text(
              "Data not found ...",
              style: TextStyle(fontSize: 14),
            ),
          ),
        )
            : errorMessage != null
            ? Text('Error: $errorMessage')
            : _tabController != null
            ? TabBarView(
          controller: _tabController,
          children: availableTAb.map((tab) {
            List<Plan> plans = tab['plans'];
            return ListView.builder(
              itemCount: plans.length,
              itemBuilder: (context, index) {
                Plan plan = plans[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 3,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Validity",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${plan.validity}",
                              style: TextStyle(fontSize: 12),
                            ),
                            Spacer(),
                            Card(
                              color: Colors.white,
                              elevation: 4,
                              child: Text("   \u{20B9} ${plan.rs}  "),
                            ),
                          ],
                        ),
                        SizedBox(height: 1),
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${plan.desc}",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        )
            : Container(
          child: Center(
            child: Text(
              "Loading...",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
