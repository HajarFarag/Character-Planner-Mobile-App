import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
runApp(
MaterialApp(
routes:{
'/': (context) => weapons(),
},
initialRoute: '/',
));
}


class weapons extends StatelessWidget{
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Weapons"),
backgroundColor: Colors.orangeAccent,
),
body: Center(
child: FutureBuilder(
future: getWeapon(10),
builder: (context, snapshot){
if (snapshot.hasData){
var weap = snapshot.data as List<Weapons>;
print('weap');
return ListView.builder(
itemCount: weap.length,
itemBuilder: (context, index){
var weaponGroup = weap[index];
return ListTile(
title: Text(weaponGroup.name,style: TextStyle(color: Colors.white)),
subtitle: Text(weaponGroup.skill,style: TextStyle(color: Colors.white)),
leading: CircleAvatar(
backgroundColor: Colors.orangeAccent,
child: Text(weaponGroup.id.toString(),style: TextStyle(color: Colors.white)),
),
trailing: Text(weaponGroup.weapon_type,style: TextStyle(color: Colors.white)),

);
});
}
else if(snapshot.hasError){
return Text("${snapshot.error}");
}
else if(!snapshot.hasData){
return CircularProgressIndicator();
}
return CircularProgressIndicator();
},
)
),
backgroundColor: Colors.black54,
);
}
}

Future<List<Weapons>> getWeapon(int id) async {
var url = 'https://raw.githubusercontent.com/HajarFarag/weapons/main/weapon';
var response = await http.get(Uri.parse(url));
if (response.statusCode == 200){
List jsonResponse = jsonDecode(response.body);
print(jsonResponse);
return jsonResponse.map<Weapons>((m) => Weapons.fromJson(m)).toList();
}
else{
throw Exception("Failed to fetch data");
}
}


class Weapons {
String name = '';
String weapon_type = '';
String skill = '';
int dmg = 0;
int id = 0;
int users = 0;

Weapons(int i, String n,String w, String s, int d, int u){
id = i;
name = n ;
weapon_type = w;
skill = s;
dmg = d;
users = u;

}

factory Weapons.fromJson(Map<String, dynamic> json){
return Weapons(json['id'], json['name'], json['category'], json['skill'], json['damage'], json['users']);
}
}