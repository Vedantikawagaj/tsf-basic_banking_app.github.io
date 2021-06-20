import 'package:basic_bank/ViewCustomers.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'InsertUser.dart';
import 'TransactionHistory.dart';
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
        
        children: [
          SizedBox(height:30),
          Text('EasyBank',
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  color: Colors.black87,
                ),]
              ),
            ),
          
          SizedBox(height:30),
          
          Text('The Easiest Application For Money Transactions',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.black87,
                ),]
              ),
              textAlign: TextAlign.center,
            ),
          
          SizedBox(height:20),
          
          Image.asset('assets/image1.jpg',height: 300,width: 300,fit: BoxFit.contain,)
            ,
          SizedBox(height:30),

          RaisedButton(onPressed: (){

              
          },
            padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          color: Color(0Xfffad5d2) ,
          
          shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(30)
              
               ),
          child: Text("Let's Get Started",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),

          ),

          
        ],
        ),  
      ),
      
     floatingActionButton: FabCircularMenu(
       
       fabColor: Color(0Xfffad5d2),
        fabSize: 70,
        ringColor: Colors.black12,
        ringDiameter: 270,
        ringWidth: 70,
        fabOpenColor: Color(0Xfffad5d2),
        fabOpenIcon: Icon(Icons.play_arrow_rounded,size: 40,),
        fabCloseIcon: Icon(Icons.close,size: 40,color: Colors.black,),
        children: [
          IconButton(
            
            icon: Icon(Icons.add,size: 40,color: Colors.black87,), 
            onPressed: (){
              print('add pressed');
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => InsertUser(),
                ),
                );

            }
           ),

           IconButton(
            icon: Icon(Icons.list,size: 40,), 
            onPressed: (){
              print('View cust pressed');
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ViewCustomers(),
                ),
                );

            }
           ),

           IconButton(
            icon: Icon(Icons.history,size: 40,), 
            onPressed: (){
              print('history pressed');
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => TransactionHistory(),
                ),
                );

            }
           ),
        ],
       
     ),
    );
  }
}