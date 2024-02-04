import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mysecondapp/main.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isLoading = false;
  List products = [];
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });
    List temp = (await FirebaseFirestore.instance
        .collection("products")
        .get()
        .then((value) => value.docs));
    products = temp.map((doc) => doc.data()).toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 100,
              title: Text(
                "Search Products",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {},
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: CircleAvatar(
                      radius: 20,
                    ))
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 280,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              hintText: "Search Shoes",
                              hintStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.settings),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 583,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      itemCount: products.length + 1,
                      itemBuilder: (context, index) {
                        index = index - 1;
                        if (index == -1) {
                          return Container(
                            width: 200,
                            height: 100,
                            child: Text(
                              "Found ${products.length} Products",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                            ),
                          );
                        } else {
                          var plant = products[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                            plant: plant,
                                          )));
                            },
                            child: Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white,width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              plant['Photo Link'],
                                            ),
                                            fit: BoxFit.cover),borderRadius: BorderRadius.circular(30)),
                                    height: 160,
                                    width: 170,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      plant['Name'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text("Rs. ${plant['Price']}"),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.white,
                                        child:Icon(Icons.heart_broken_rounded),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          );

                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
