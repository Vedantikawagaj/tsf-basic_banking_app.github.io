class UserTable{
  final int id;
  final String name;
  final String email;
  final double curBal;
  final int phoneNo;

  UserTable({

    this.id,
    this.name,
    this.email,
    this.curBal,
    this.phoneNo,
  });

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'email': email,
      'curBal': curBal,
      'phoneNo': phoneNo,
    };
  }
}