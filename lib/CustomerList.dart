import 'package:flutter/material.dart';

import 'Database/DatabaseHelper.dart';
import 'MoneyTransfer.dart';


class CustomerList extends StatefulWidget {
  final String rname,sname;
  final double rbalance,sbalance;
  final int cusId,tid;

  CustomerList({
    this.sbalance,
    this.sname,
    this.rname,
    this.rbalance,
    this.tid,
    this.cusId,
  });
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer Money To'
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
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Color(0Xfffad5d2),
          padding: EdgeInsets.fromLTRB(10, 10, 10,10 ),
          height: 1000,
          child: FutureBuilder(
              initialData: [],
              future: dbHelper.fetchUserDetails(),
              builder: (context,index){
                return ListView.builder(
                    
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: index.data.length,
                    itemBuilder: (context,indx){
                        return GestureDetector(
                        onTap: () {
                          setState(() => {
                            print('Inside setstate')
                               
                              });
                         
                        },
                        child: 
                        Column(children: [
                          ListTile(
                            
                            tileColor: Colors.white,
                            leading: CircleAvatar(
                      radius: 30.0,
                      child:Icon(Icons.person,color: Colors.black,size: 50),
                      
                      
                      backgroundColor: Colors.grey[200],
                      ),
                      
                    title: Text(index.data[indx].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    
                    subtitle: Row(
                      children: [
                        
                        Icon(Icons.attach_money,color: Colors.green,),
                        Text('${index.data[indx].curBal}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                        ),
                        ),

                      ],
                    ),
                    trailing: GestureDetector(
                    child: Icon(Icons.send,color: Colors.black,),
                    
                    onTap: (){
                       
                        print('Transfered to ${index.data[indx].name}');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => MoneyTransfer(
                              sname: widget.sname,
                              sbalance: widget.sbalance,
                              cusId: widget.cusId,
                              rname: index.data[indx].name,
                              rbalance: index.data[indx].curBal,
                              tid: index.data[indx].id,
                              status: 'true',
                          )
                          ),
                      );
                      
                      print('name: ${index.data[indx].name}');
                      print('balance: ${index.data[indx].curBal}');
                      print('length: ${index.data.length}');
                      print('phoneno: ${index.data[indx].phoneNo}');
                      print('tid ${index.data[indx].id}');
                        }
                 
                    ),
                  
                  ),
                  Divider(height: 4,color: Color(0Xfffad5d2),),
                        ],)
                        
                      );
                  
                    },
                );
              }
            )
          
          ),
        )
    );
    
  }
}