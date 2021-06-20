
import 'package:basic_bank/Database/DatabaseHelper.dart';
import 'package:basic_bank/FirstPage.dart';
import 'package:basic_bank/Models/TransactonModel.dart';
import 'package:basic_bank/TransactionHistory.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class MoneyTransfer extends StatefulWidget {
  final double sbalance,tamount,rbalance;
  final int cusId,tid;
  final String sname,rname;
  String status;
  
  MoneyTransfer({
    this.sbalance,
    this.rbalance,
    this.tamount,
    this.cusId,
    this.sname,
    this.rname,
    this.status,
    this.tid,
  });
  @override
  _MoneyTransferState createState() => _MoneyTransferState();
}

class _MoneyTransferState extends State<MoneyTransfer> {
  double amount;
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
        title: Text('Make Transaction'
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

      body: Builder(
        builder: (BuildContext context){
            return SingleChildScrollView(
            
            child: Container(
              padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(children: [
               
                Image.asset('assets/Transaction.jpg',),
                
                SizedBox(height: 30),
                TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                 
                  focusedBorder: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(25),
                      
                  ),
                  
                  fillColor: Colors.white,
                  
                  hintText: "Amount",
                  hintStyle: TextStyle(
                    color: Colors.black26
                    
                    ),
                    
                  labelText: 'Enter the Amount to be tranfered',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.attach_money_sharp,color: Colors.black,),
                 ),
                 onChanged: (value) {
                   
                    amount = double.parse(value);
                    
                    print('tamount: $amount');
						    
						    	},
              ),
              SizedBox(height: 30),
              RaisedButton(
              onPressed:() async {
                print('proceed pressed');
                print('${widget.sbalance}');
                print('$amount');
                if(widget.sbalance >= amount && amount>=0){
                  widget.status = 'Sucessful';
                  double senderRemainingBal = widget.sbalance - amount;

                  await dbHelper.updateCurBalance(widget.cusId, senderRemainingBal);

                  double receiverRemainingBal = widget.rbalance + amount;

                  await dbHelper.updateCurBalance(widget.tid, receiverRemainingBal);

                  print('status : ${widget.status}');
                  
                  Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content:Text('Transaction successful!!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0Xfffad5d2),
                        ), 
                        textAlign: TextAlign.center,
                    ),
                    
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.black,
                  )
                  );
                  
                }
                
                else{
                  widget.status = 'Failed';
                  print('status : ${widget.status}');
                  Scaffold.of(context).showSnackBar(
                  SnackBar(

                    content: Text('Transaction Failed....Insufficient Balance!!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0Xfffad5d2),
                    ),
                    textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.black,
                  )
                  );
                }

                TransactionTable _transactions = TransactionTable(
                  sname: widget.sname,
                  rname: widget.rname,
                  tid: widget.tid,
                  id: widget.cusId,
                  tamount: amount,
                  status: widget.status,
                );
                
                await dbHelper.insertTransaction(_transactions);
                print('trans ins');
              },
              padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
              color: Color(0Xfffad5d2) ,
            
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(30)
                
                 ),
              child: Text('Proceed',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,)
                    ,)
              
              )


                
              ],),)

        );
        }
              
      ),
      
      floatingActionButton: FabCircularMenu(
        fabColor: Color(0Xfffad5d2),
        fabSize: 64,
        ringColor: Colors.black12,
        ringDiameter: 300,
        ringWidth: 90,
        fabOpenColor: Colors.black12,
        children: [
            IconButton(
            
            icon: Icon(Icons.home,size: 40,color: Colors.black87,), 
            onPressed: (){
              print('home pressed');
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => FirstPage(),
                ),
                );

            }
           ),

           IconButton(
            icon: Icon(Icons.history,size: 40,), 
            onPressed: (){
              print('View cust pressed');
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => TransactionHistory(),
                ),
                );

            }
           ),
      ],),
    );
  }
}