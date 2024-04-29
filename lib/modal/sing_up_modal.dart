class SingUpModal{
  final String? email;
  final String? password;
  final String? name;
  final String? phone;

 SingUpModal({ required this.email , required this.password,required this.name,required this.phone});

 Map<String,dynamic> toJson(){
   Map<String ,dynamic> data = Map<String ,dynamic>();
   data['email']  = email;
   data['password'] = password;
   data['f_name'] = name;
   data['phone'] =phone;

   return data;
 }
}