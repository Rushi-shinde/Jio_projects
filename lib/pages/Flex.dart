import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  const FlexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Flex")),
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: 1000.00,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
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
                                color: Colors.red,
                              ) //BoxDecoration
                          ), //Container
                        ) //Flexible
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Container(
                          width: 380,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue), //BoxDecoration
                        ), //Container
                      ),
                    ),
                    //Flexible
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Container(
                            width: 180,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                            ), //BoxDecoration
                          ), //Container
                        ), //Flexible
                        const SizedBox(
                          width: 20,
                        ), //SizedBox
                        Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Container(
                                width: 180,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.cyan,
                                ) //BoxDecoration
                            ) //Container,
                        ) //Flexible
                      ],
                    ), //Row
                  ],
                ),
              ), //Column
            ), //Container
          ),
        ) //Center,
      ),
    );
  }
}
