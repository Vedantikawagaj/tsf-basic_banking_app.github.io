
import 'package:basic_bank/Database/DatabaseHelper.dart';
import 'package:basic_bank/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'Database/DatabaseHelper.dart';
import 'FirstPage.dart';

class InsertUser extends StatefulWidget {
  @override
  _InsertUserState createState() => _InsertUserState();
}

class _InsertUserState extends State<InsertUser> {
  String name;
  String email;
  int phoneNo;
  double curBal;

  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         
        title: Text('Create New User'
        ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        ),
        leading: IconButton(icon: Icon(
				    Icons.arrow_back,color: Colors.black,size: 30,),
				    onPressed: () {
		    	
				    }
		    ),
        centerTitle: true,
        backgroundColor: Color(0Xfffad5d2) ,
        
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextFormField(
            
              
              keyboardType: TextInputType.name,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
               
                focusedBorder: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(25),
                  
                  
                ),
                
                fillColor: Colors.white,
                
                hintText: "Enter the Username",
                hintStyle: TextStyle(
                  color: Colors.black26
                  
                  ),
                  
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.person,color: Colors.black,),
               ),
               
               onChanged: (value) {
                 
                
						    	debugPrint('Something changed in Name Text Field');
                  name = value;
						    	
						    },
            ),

            SizedBox(height: 20),
            TextField(
              
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                
                
              
                focusedBorder: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(25),
                  
                  
                ),
                fillColor: Colors.white,
                
                hintText: "Enter the Email Id",
                hintStyle: TextStyle(
                  color: Colors.black26
                  
                  ),
                labelText: 'Email Id',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.email,color: Colors.black,),
               ),
              
               keyboardType: TextInputType.emailAddress,
               onChanged: (value) {
                 
							    debugPrint('Something changed in Description Text Field');
							  
                  email= value;
                  }
            ),
            SizedBox(height: 20),
            TextField(
              
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                
                
                focusedBorder: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(25),
                  
                  
                ),
                fillColor: Colors.white,
                
                hintText: "Enter the Phone Number",
                hintStyle: TextStyle(
                  color: Colors.black26
                  
                  ),
                labelText: 'Phone Number',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.phone,color: Colors.black,),
               ),
               keyboardType: TextInputType.phone,
               onChanged: (value){
                 phoneNo = int.parse(value);
               },
            
            ),
            SizedBox(height: 20),
            TextField(
              
              textAlign: TextAlign.center,
              decoration: InputDecoration(
               
                focusedBorder: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(25),
                  
                  
                ),
                fillColor: Colors.white,
                
                hintText: "Enter the Current balance",
                hintStyle: TextStyle(
                  color: Colors.black26
                  
                  ),
                labelText: 'Current Balance',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.attach_money,color: Colors.black,),
               ),
              
               keyboardType: TextInputType.number,
               onChanged: (value){
                 curBal = double.parse(value);
               },
            ),
            SizedBox(height: 70),
            Center(
              child: RaisedButton(onPressed: () async
          {
              if(name!= null && email!= null && phoneNo!=null && curBal!=null){
                UserTable _user= UserTable(
                  name: name,
                  email: email,
                  phoneNo: phoneNo,
                  curBal: curBal,
                );
                print('insert start');
                await dbHelper.insertUser(_user);
                print('insert end');
                
              }
          },
          padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
          color: Color(0Xfffad5d2) ,
          // color: Colors.red[50],
          shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(30)
                
                 ),
          child: Text("Create User",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
          ),),
          ),
          
            ),
          
        ],),
        
        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home,size: 30,color: Colors.black,),
        backgroundColor: Color(0Xfffad5d2),
        onPressed: (){
           Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => FirstPage(),
                ),
                );
        },
        ),  
    );
  }
  
}