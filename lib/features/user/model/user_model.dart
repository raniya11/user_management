class UserModel{

  final String? id;
  final String? name;
  final String? email;
  final DateTime? createdat;
  final int? status;

  UserModel({this.name, this.createdat, this.email, this.id, this.status});

  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(name: json['name'], createdat: json['createdat'], email: json['email'], id: json['id'], status: json['status']);
  }

  toMap(UserModel user){
    return{
      'id':user.id,
      'name':user.name,
      'email':user.email,
      'createdat':user.createdat,
      'status':user.status,
    };
  }

}