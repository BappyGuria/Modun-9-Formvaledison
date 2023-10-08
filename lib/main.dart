import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.white,
              backgroundColor: Colors.pinkAccent,
              centerTitle: true)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<WaterTracker> waterTrackerConsume = [];
  final TextEditingController _glassCount = TextEditingController(text: '1');
  int totalGlassCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
      ),
      body: Column(
        children: [
          Text(
            'Total Consume',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            '$totalGlassCount',
            style: const TextStyle(
              fontSize: 35,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(

                width: 100,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _glassCount,
                    keyboardType: TextInputType.number,
                  )
              ),
              ElevatedButton(
                  onPressed: () {

                    int amount = int.parse(_glassCount.text.trim());
                    totalGlassCount += amount;
                    WaterTracker waterTracker = WaterTracker(DateTime.now(), amount);
                    waterTrackerConsume.add(waterTracker);

                    setState(() {});
                  },
                  child: const Text('Add')),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: waterTrackerConsume.length,
                  // reverse: true,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onLongPress: (){
                          int incrementCount = waterTrackerConsume[index].noOfGlass;
                          waterTrackerConsume.remove(waterTrackerConsume[index]);
                          totalGlassCount = totalGlassCount - incrementCount;
                          setState(() {

                          });
                        },
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(DateFormat('m:h A dd.MM.yyyy')
                            .format(waterTrackerConsume[index].time)),
                        trailing:
                            Text('${waterTrackerConsume[index].noOfGlass}'),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

class WaterTracker {
  final DateTime time;
  final int noOfGlass;

  WaterTracker(this.time, this.noOfGlass);
}
