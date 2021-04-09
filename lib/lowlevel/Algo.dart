import 'dart:io';
import 'package:passman/gloab.dart';
import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart';
import 'dart:typed_data';
import 'dart:convert';
void main(){
  String a,b;
  a=stdin.readLineSync();
  b=stdin.readLineSync();//key
  var byte = Encrypt(a, b);
  var revm=Decrypt(byte, b);
  if(!lowStat){
    print("internal error");
  }
  print(revm);
}
//given a string gives its hash
String hashGen(String username){
  var bytes = utf8.encode(username);
  var digest = sha1.convert(bytes);
  lowStat=true;
  return digest.toString();
}
//decrypts msg
//key length must be 16 32 or 64
String Decrypt(List<int> _bytedata,String _key){
  final iv = IV.fromLength(16);
  final key = Key.fromUtf8(_key);
  final encrypter = Encrypter(AES(key));
  Encrypted a = Encrypted(Uint8List.fromList(_bytedata));
  try {
    final decrypted = encrypter.decrypt(a, iv: iv);
    lowStat=true;
    return decrypted;
  } catch (_) {
    lowStat=false;
    lowMsg="Incorrect password";
    return "Incorrect password";
  }
}
//encrypts msg
////key length must be 16 32 or 64
List<int> Encrypt(String msg,String key){
  if(key.length!=16 && key.length!=32){
    lowStat=false;
    lowMsg="Incorrect key size";
    return [4,0,4];
  }
  final pass = Key.fromUtf8(key);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(pass));
  final encrypted = encrypter.encrypt(msg, iv: iv);
  List<int> _bytedata = encrypted.bytes;
  lowStat=true;
  return _bytedata;
}