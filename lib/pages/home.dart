import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jio_project/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import '../models/ProductModel.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int crossAxisCount = 4;
  List <ProductModel> productList =[];

  Future <List<ProductModel>> getProductApi () async{
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
    {
      for(Map i in data){
        productList.add(ProductModel.fromJson(i));
      }
      return productList;
    }else{
      return productList;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("My App", style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SizedBox(
            height: 1000.00,
            child: FutureBuilder(
                future: getProductApi(),
                builder: (context , snapshot){
                  if (!snapshot.hasData) {
                    const Text('Loading....');
                  } else {
                    return LayoutBuilder(
                    builder: (context, constraints) {
                    // Adjust the crossAxisCount based on screen width
                    if (constraints.maxWidth <= 600) {
                      crossAxisCount = 2; // For smaller screens
                    } else if (constraints.maxWidth <= 1200) {
                      crossAxisCount = 3; // For medium-sized screens
                    } else {
                      crossAxisCount = 4; // For larger screens (e.g., desktop)
                    }

                    return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 30,),
                        itemBuilder: (context,index){
                          return GridTile(
                              header: Container(
                                decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.all(8),
                                  child: Text(productList[index].title.toString(), style: const TextStyle(color: Colors.white),)),
                            footer: Container(
                                decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(8),
                                child: Text('Price : ${productList[index].price} Rs.', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.00))),
                              child: Card(child: Image.network(productList[index].image.toString(),width: 100.00,)),
                          );
                        });
                  }
                    );}
                      return const Center(child: Text("Loading.......",style: TextStyle(color: Colors.deepPurple), ));
                }),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
