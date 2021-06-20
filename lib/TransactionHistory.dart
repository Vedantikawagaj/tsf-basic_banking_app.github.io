import 'package:basic_bank/Database/DatabaseHelper.dart';
import 'package:basic_bank/FirstPage.dart';
import 'package:flutter/material.dart';


class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: IconThemeData(
          color: Colors.black, ),
        backgroundColor: Color(0Xfffad5d2) ,
        title: Text('Transaction History',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black),
          ),
          centerTitle: true
        ,),

        body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Color(0Xfffad5d2),
          padding: EdgeInsets.fromLTRB(10, 10, 10,10 ),
          height: 1000,
          child: FutureBuilder(
              initialData: [],
              future: dbHelper.fetchTransactionDetails(),
              builder: (context,index){
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: index.data.length,
                    itemBuilder: (context,indx){
                        return GestureDetector(
                        onTap: () {
                          setState(() => {
                            print('Inside setstate'),
                            
                              });
                         
                        },
                        child: Column(children: [
                          ListTile(
                            tileColor: Colors.white,
                            leading: Icon(Icons.person,size: 40,color: Colors.black,),
                
                    title: Text('${index.data[indx].sname} --> ${index.data[indx].rname}'),
                    
                    subtitle: Text(
                      (() {
                          if(index.data[indx].status=='failed'){
                            return 'Transaction Failed';
                          }
                          else {
                            return 'Transaction Successful';
                          }
                      }())
                      ),
                    trailing: GestureDetector(
                    child: 
                       
                        Text('₹ ${index.data[indx].tamount}',
                        style: TextStyle(color: Colors.green,fontSize: 20),
                        ),
                      
                    
                    onTap: (){
                       
                        print('amount');
                        }
                 
                    ),
                      

                    onTap: (){
                      
                      
                    },
                    
                  ),
                  Divider(height: 5,thickness: 4,color: Color(0Xfffad5d2),),
                        ],)
                        
                      );
                  
                    },
                );
              }
            )
          
          ),
        ),

        floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => FirstPage(),
                ),
                );
            
        },
        child: Icon(Icons.home,size: 40,color: Color(0Xfffad5d2),),
        backgroundColor: Colors.white,
      ),
    );
  }
}