import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mysecondapp/menu.dart';
import 'package:uuid/uuid.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MenuScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  final plant;

  const HomeScreen({Key? key, required this.plant}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.plant);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 40,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.plant['Photo Link'] == "" ? "Dhruv" : widget.plant['Photo Link'],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.plant['Name'],
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.plant['Description'],
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
          Spacer(),
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(30)),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(30),
            //   color: Colors.green,
            // ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Icon(Icons., color: Colors.white),
                        Container(
                          height: 28,
                          child: Image.asset('lib/icons/ruler.png',width: 95,height: 20,),

                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width-40,
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Size",
                                style: TextStyle(fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(
                                height: 40,
                                width: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){
                                        selectedSize=index;
                                        setState(() {});
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: selectedSize==index?Colors.black:Colors.grey,
                                        radius: 20,
                                        child: Text(
                                          "${index + 6}",
                                          //plant['height'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: 6,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     Icon(Icons.thermostat, color: Colors.white),
                    //     SizedBox(
                    //       height: 10,
                    //     ),
                    //     Text(
                    //       "Water",
                    //       style: TextStyle(
                    //           color: Colors.white, fontWeight: FontWeight.bold),
                    //     ),
                    //     SizedBox(
                    //       height: 5,
                    //     ),
                    //     Text("Dhruv",
                    //       //plant['water'],
                    //       style: TextStyle(
                    //           color: Colors.white, fontWeight: FontWeight.w500),
                    //     )
                    //   ],
                    // ),
                    // Column(
                    //   children: [
                    //     Icon(Icons.photo_rounded, color: Colors.white),
                    //     SizedBox(
                    //       height: 10,
                    //     ),
                    //     Text(
                    //       "Pot",
                    //       style: TextStyle(
                    //           color: Colors.white, fontWeight: FontWeight.bold),
                    //     ),
                    //     SizedBox(
                    //       height: 5,
                    //     ),
                    //     Text("Dhruv",
                    //       //plant['plantPotHeight'],
                    //       style: TextStyle(
                    //           color: Colors.white, fontWeight: FontWeight.w500),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs. ${widget.plant['Price']}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        Fluttertoast.showToast(msg: "Order Placed Successfully!");
                        var order = widget.plant as Map<String, dynamic>;
                        order["userName"] = "Dhruv";
                        Uuid uuid = const Uuid();
                        String docId = uuid.v1();
                        order['id'] = docId;
                        await FirebaseFirestore.instance
                            .collection("orders")
                            .doc(docId)
                            .set(order);
                      },
                      child: Container(
                        //alignment:Alignment.center,
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade800),
                        child: Center(
                            child: Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
