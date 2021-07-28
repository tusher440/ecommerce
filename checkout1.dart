import 'package:ecommerceapp/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';




class checkout extends StatefulWidget {
  const checkout({Key? key}) : super(key: key);

  @override
  _checkoutState createState() => _checkoutState();
}


class _checkoutState extends State<checkout> {

  var Street1;
  var Street2;
  var City;
  var State;
  var Country;



  TextEditingController _Street1Controller = TextEditingController();
  TextEditingController _Street2Controller = TextEditingController();
  TextEditingController _CityController = TextEditingController();
  TextEditingController _StateController = TextEditingController();
  TextEditingController _CountryController = TextEditingController();

  userdata()async{
    
    FirebaseFirestore.instance.collection("userdata").add({
      "Street1": Street1,
      "Street2": Street2,
      "City": City,
      "State": State,
      "Country": Country,
    });

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("userdata");
    return _collectionRef.doc("userdata").set({
      "Street 1":_Street1Controller.text,
      "Street 2":_Street2Controller.text,
      "City":_CityController.text,
      "State":_StateController.text,
      "Country":_CountryController.text,
    }).then((value) => print("userdata")).catchError((error)=>print("failed data"));
  }


  @override
  void initState() {
    userdata();
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios_outlined,
          color: Colors.black,
        ),
        title: Center(
          child: Text("Checkout",
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Divider(
                        height: 10,
                        color: Colors.red,
                        indent: 5,
                        endIndent: 5,
                        thickness: 2,
                      );
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Icon(Icons.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  IconButton(
                    onPressed: () {
                      Divider(
                        height: 10,
                        color: Colors.redAccent,
                        indent: 5,
                        endIndent: 5,
                        thickness: 2,
                      );

                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 90, bottom: 10),
                      child: Icon(Icons.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  IconButton(
                    onPressed: () {
                      Divider(
                        height: 10,
                        color: Colors.redAccent,
                        indent: 5,
                        endIndent: 5,
                        thickness: 2,
                      );

                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 170, bottom: 10),
                      child: Icon(Icons.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text("Delivery",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text("Address",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text("Payments",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                children: [

                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.check_circle,
                    color: Colors.green,
                    ),
                  ),
                  Text("Billing address is the same as delivery address",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("Street 1",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

            Container(
              //height: 40,
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (input) {
                    Street1 = input;
                  },
                  controller: _Street1Controller,
                  decoration: InputDecoration(
                    hintText: "abc avenue Bangladesh",
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("Street 2",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

            Container(
              //height: 40,
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (input) {
                    Street2 = input;
                  },
                  controller: _Street2Controller,
                  decoration: InputDecoration(
                    hintText: "Road no 12",
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("City",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

            Container(
              //height: 40,
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (input) {
                    City = input;
                  },
                  controller: _CityController,
                  decoration: InputDecoration(
                    hintText: "Dhaka",
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 320),
                          child: Text("State",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            ),

            Container(
              //height: 40,
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  onChanged: (input) {
                    State = input;
                  },
                  controller: _StateController,
                  decoration: InputDecoration(
                    hintText: "Dhaka",
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("Country",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Container(
              //height: 40,
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  onChanged: (input) {
                    Country = input;
                  },
                  controller: _CountryController,
                  decoration: InputDecoration(
                    hintText: "Bangladesh",
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Check(),
                        )
                        );
                      },

                      child: Text("BACK",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                        ),
                      ),

                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: FlatButton(
                           // color: Colors.orange,

                            onPressed: () {
                              setState(() {
                                userdata();
                              });

                            },
                            child: Text("NEXT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

