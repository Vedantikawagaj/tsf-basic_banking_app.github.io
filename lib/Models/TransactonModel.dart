class TransactionTable{
  final int id;
  final int tid;
  final String sname;
  final String rname;
  final double tamount;
  final String status;

  TransactionTable({

    this.id,
    this.tid,
    this.sname,
    this.rname,
    this.tamount,
    this.status,
  });

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'tid': tid,
      'sname': sname,
      'rname': rname,
      'tamount': tamount,
      'status': status,
    };
  }
}