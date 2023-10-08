import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<WaterTracker> waterTrackerList = [];
  int totalCount = 0;

  final TextEditingController _counterControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Water Glass Count'),
            Text('$totalCount',style: const TextStyle(
              fontSize: 35
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                 SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _counterControler,
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      int glassCountNumber = int.parse(_counterControler.text.trim());
                      WaterTracker waterTracker = WaterTracker(DateTime.now(), glassCountNumber);
                      totalCount = totalCount + glassCountNumber;
                      waterTrackerList.add(waterTracker);

                      setState(() {

                      });
                    },
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        foregroundColor: Colors.white),
                    icon: const Icon(Icons.add))
              ],
            ),
            const SizedBox(height: 40,),
            Expanded(child: ListView.builder(
              itemCount: waterTrackerList.length,
                itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: ListTile(
                  onLongPress: (){
                    int incrementCount = waterTrackerList[index].glassCount;
                    waterTrackerList.remove(waterTrackerList[index]);
                          totalCount = totalCount - incrementCount;

                    setState(() {

                    });
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                      child: Text('${index +1}'),
                  ),
                  title: Text('${waterTrackerList[index].time}'),
                  trailing: Text('${waterTrackerList[index].glassCount}'),
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}

class WaterTracker {
  final DateTime time;
  final int glassCount;

  WaterTracker(this.time, this.glassCount);
}
