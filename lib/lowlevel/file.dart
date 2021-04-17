import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
///save initial user data to json
void writeUser(Map<String,dynamic> user)async{
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  final filepath = "$path/user";
  File file=new File(filepath);
  bool exist=await file.exists();
  if(exist){
    file.writeAsString(json.encode(user));
  }else{
    await file.create(recursive: true);
    file.writeAsString(json.encode(user));
  }
}
///get userinfo
Future<Map<String,dynamic>> getUser()async{
  Map<String,dynamic> user;
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  final filepath = "$path/user";
  File file=new File(filepath);
  bool exist=await file.exists();
  if(exist){
    String content=await File(filepath).readAsString();
    try {
      user = json.decode(content);
    }catch(e){
      user=null;
    }
  }else{
    await file.create(recursive: true);
    user=null;
  }
  return user;
}
///save new password
Future<void> save(Map<String,String> data, Map<String,dynamic> pass)async{
  Map<String,dynamic> temp;
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  final filepath = "$path/user";
  File file=new File(filepath);
  String content=await File(filepath).readAsString();
  temp = json.decode(content);
  temp["data"].add(data);
  temp[pass["key"]]=pass["pair"];
  file.writeAsString(json.encode(temp));
}