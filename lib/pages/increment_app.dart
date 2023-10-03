import 'package:flutter/material.dart';

class Increment extends StatelessWidget {
  const Increment({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: IncrementPage()
    );
  }
}

class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});

  @override
  State<IncrementPage> createState() => IncrementPageState();
}

class IncrementPageState extends State<IncrementPage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Counter Application')),
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter: $count',style: const TextStyle(
                fontSize: 50.00,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(
                height: 10.00,
              ),
              ElevatedButton(
                  onPressed:(){
                    setState(() {
                      count++;
                    });
                  },
                  child: const Text('Press TO Increment'),
              ),
             const SizedBox(
               height: 30.00,
             ),
              SizedBox(
                height: 50.00,
                width: 200.00,
                child: ElevatedButton(
                    onPressed:(){},
                    child: const Text("Submit")),
              ),
              const SizedBox(
                height: 100.00,
              ),
              SingleChildScrollView(
                child: Container (
                  width: 1000.00,
                  height: 800.00,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ), //BoxDecoration
                        ), //Container
                      ), //Flexible
                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Container(
                            height: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ) //BoxDecoration
                        ), //Container
                      ),
                     ],
                  ),
                ),
              )],
    ),
    ),
        ),
      drawer: const Drawer(),
    );
  }
}

