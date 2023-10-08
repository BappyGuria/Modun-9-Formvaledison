import 'package:flutter/material.dart';

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
  double result = 0;

  final TextEditingController _fristNumberControler = TextEditingController();
  final TextEditingController _sceendNumberControler = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Validation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _fristNumberControler,
                  decoration: const InputDecoration(hintText: 'Number 1'),
                  keyboardType: TextInputType.number,
                  validator: (String? value){
                    if(value ?.isEmpty ?? true){
                      return 'Enter valid value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _sceendNumberControler,
                  decoration: const InputDecoration(
                    hintText: 'Number 2',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (String? value){
                    if(value == null){
                      return 'Enter a valid Number';
                    }if(value.trim().isEmpty){
                      return 'Enter a valid Number';
                    }
                    // if(value ?. isEmpty ?? true){
                    //   return 'Enter valid Value';
                    // }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          if(_formKey.currentState! .validate()){
                            double fristNumber = double.parse(_fristNumberControler.text.trim());
                            double sceenNumber = double.parse(_sceendNumberControler.text.trim());

                            print(fristNumber);
                            print(sceenNumber);

                            result = (fristNumber + sceenNumber);

                            setState(() {

                            });
                          }
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add')
                    )
                  ],
                ),

                Text('Result is = $result')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
