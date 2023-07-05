import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool? isChecked = false ;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff363636),
          body: Container(
            width: double.infinity,
            margin: EdgeInsets.all(13),
            child: Stack(
              children: [
                SizedBox(
                  height: 13,
                ),

                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                },icon: Icon(Icons.cancel_outlined,size: 35, color: Colors.white,)),


                 Column(
                    children: [
                      SizedBox(height: 100),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(

                          'Create Account ',
                          style: TextStyle(
                            fontSize: 35, color: Colors.white ,
                            fontWeight: FontWeight.bold ,
                          ),

                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: 50),


                      Padding(
                        padding: const EdgeInsets.only(right: 280),
                        child: Text(
                          "Name" ,
                          style: TextStyle(
                            fontSize: 12, color: Colors.white ,
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 15 , right: 15 , top: 10),
                        child: TextField(
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            filled: true, fillColor: Color(0xffF5EDDA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right: 280),
                        child: Text(
                          "Email" ,
                          style: TextStyle(
                            fontSize: 12, color: Colors.white ,
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 15 , right: 15 , top: 10),
                        child: TextField(
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            filled: true, fillColor: Color(0xffF5EDDA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.only(right: 270),
                        child: Text(
                          "Password" ,
                          style: TextStyle(
                            fontSize: 12, color: Colors.white ,
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 15 , right: 15 , top: 10),
                        child: TextField(
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            filled: true, fillColor: Color(0xffF5EDDA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.only(right: 220),
                        child: Text(
                          "Confirm Password" ,
                          style: TextStyle(
                            fontSize: 12, color: Colors.white ,
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 15 , right: 15 , top: 10),
                        child: TextField(
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            filled: true, fillColor: Color(0xffF5EDDA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor:  Color(0xffA9A454),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool;
                              });
                            },
                          ),
                          Text ( "Remember me     " ,
                            style: TextStyle(
                              color: Colors.white,
                            ),)
                        ],
                      ),
SizedBox(height: 40 ,),

                      MaterialButton(
                        onPressed: () {},
                        height: 60,
                        minWidth: 200,
                        child: Text('Create' , style: TextStyle(
                          fontSize: 23),
                        ),

                        textColor: Colors.black,
                        color: Color(0xffF5EDDA),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                      ),
                    ],
                  ),


              ],
            ),
          ),
        ));
  }
}
