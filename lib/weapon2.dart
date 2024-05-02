import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
      MaterialApp(
        routes:{
          '/': (context) => weapons(),
          ('/details'): (context) => detailWeapons(),
        },
        initialRoute: '/',
      ));
}

class weapons extends StatefulWidget{
  @override
  State<weapons> createState() => _weaponsState();
}

class _weaponsState extends State<weapons>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elden Ring Weapons"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
          child: FutureBuilder<List<Weapons>>(
            future: getWeapon(),
            builder: (context, snapshot){
              if (snapshot.hasData){
                var Weapons = snapshot.data;
                return ListView.builder(
                    itemCount: Weapons?.length,
                    itemBuilder: (context, ind){
                      var weaponGroup = Weapons![ind];
                      var one = weaponGroup.getName();
                      var two = weaponGroup.getCatagory();
                      var idValue = weaponGroup.getId().toString();
                      return ListTile(
                          title: Text(one!),
                          subtitle: Text(two!),textColor: Colors.white,
                          leading: CircleAvatar(
                            child: Text("$idValue"),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,),
                          onTap: () async{
                            Navigator.pushNamed(context, '/details', arguments: weaponGroup);
                          }
                      );
                    }
                );
              }
              else if(snapshot.hasError){
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black87,),
            label:"Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label:"Weapons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.api),
            label:"Compare",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label:"Account",
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

Future<List<Weapons>> getWeapon() async {
  var url = 'https://raw.githubusercontent.com/BoredTourist/EldenBlingAPI/main/EldenAPI';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200){
    var jsonResponse = jsonDecode(response.body);
    return jsonResponse.map<Weapons>((m) => Weapons.fromJson(m)).toList();
  }
  else{
    throw Exception("Failed to fetch data");
  }
}

class detailWeapons extends StatefulWidget{
  @override
  State<detailWeapons> createState() => _detailState();
}
class _detailState extends State<detailWeapons>{
  late Weapons weaponDetails;
  @override
  Widget build(BuildContext context) {
    weaponDetails = ModalRoute.of(context)?.settings.arguments as Weapons;

    String imageLink = weaponDetails._image!;
    String category = weaponDetails._category!;
    String skill = weaponDetails._skill!;

    return Scaffold(
      appBar: AppBar(
        title: Text(weaponDetails._name!),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Container(
            child: Image.network("$imageLink"),
          ),
          Column(children: [
            Container(child: Text("Catagory: $category"),),
            Container(child: Text("Skill: $skill ")),
          ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    child: Text("Attack"),),
                  Container(
                    child: Text("Phy "),),
                  Container(
                    child: Text("Mag"),),
                  Container(
                    child: Text("Fire"),),
                  Container(
                    child: Text("Ligt"),),
                  Container(
                    child: Text("Holy"),),
                  Container(
                    child: Text("Crit"),),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text("Guard"),),
                  Container(
                    child: Text("Phy "),),
                  Container(
                    child: Text("Mag"),),
                  Container(
                    child: Text("Fire"),),
                  Container(
                    child: Text("Ligt"),),
                  Container(
                    child: Text("Holy"),),
                  Container(
                    child: Text("Crit"),),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(child: Text("Scaling"),),
                  Container(child: Text("STR "),),
                  Container(child: Text("DEX"),),
                ],
              ),
              Column(
                children: [
                  Container(child: Text("Requires"),),
                  Container(child: Text("STR"),),
                  Container(child: Text("DEX"),),
                ],
              ),
            ],

          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black87,),
            label:"Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label:"Weapons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.api),
            label:"Compare",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label:"Account",
          ),
        ],
      ),
      backgroundColor: Colors.white,

    );
  }
}


class Weapons {
  late int?  _id;
  late String?  _name;
  late String?  _image;
  late String?  _description;
  late String?  _category;
  late String? _skill;

  /*
  late String? _aName;
  late String? _aPhy;
  late int? _aPhyamount;
  late String? _aMag;
  late int? _aMagamount;
  late String? _aFire;
  late int? _aFireamount;
  late String? _aLigh;
  late int? _aLighamount;
  late String? _aHoly;
  late int? _aHolyamount;
  late String? _aCrit;
  late int? _aCritamount;
  */

  Weapons(
      int?    id,
      String? n,
      String? im,
      String? d,
      String? c,
      String? s,

      /*
      String? aName,
      String? aPhy,
      int?    aPhyamount,
      String? aMag,
      int?    aMagamount,
      String? aFire,
      int?    aFireamount,
      String? aLigh,
      int?    aLighamount,
      String? aHoly,
      int?    aHolyamount,
      String? aCrit,
      int?    aCritamount,
      */
      ){
    _id = id;
    _name = n;
    _image = im;
    _description = d;
    _category = c;
    _skill = s;
  }

  factory Weapons.fromJson(Map<String, dynamic> json){
    return Weapons(
      json['id'],
      json['name'],
      json['image'],
      json['description'],
      json['category'],
      json['Skill'],
    );
  }
  int? getId() => _id;
  String? getName() => _name;
  String? getImage() => _image;
  String? getDescription() => _description;
  String? getCatagory() => _category;
  String? getSkill() => _skill;
}


/*
class weaponAttackStats{
  late String? _attack;
  late String? _aName;
  late String? _aPhy;
  late int? _aPhyamount;
  late String? _aMag;
  late int? _aMagamount;
  late String? _aFire;
  late int? _aFireamount;
  late String? _aLigh;
  late int? _aLighamount;
  late String? _aHoly;
  late int? _aHolyamount;
  late String? _aCrit;
  late int? _aCritamount;


  Weapons(
      String? attack,
      String? aName,
      String? aPhy,
      int?    aPhyamount,
      String? aMag,
      int?    aMagamount,
      String? aFire,
      int?    aFireamount,
      String? aLigh,
      int?    aLighamount,
      String? aHoly,
      int?    aHolyamount,
      String? aCrit,
      int?    aCritamount,

      ){
    _attack = attack;
    _aName = aName;
    _aPhy = aPhy;
    _aPhyamount = aPhyamount;
    _aMag = aMag;
    _aMagamount = aMagamount;
    _aFire = aFire;
    _aFireamount = aFireamount;
    _aLigh = aLigh;
    _aLighamount = aLighamount;
    _aHoly = aHoly;
    _aHolyamount = aHolyamount;
    _aCrit = aCrit;
    _aCritamount = aCritamount;
  }

  factory weaponAttackStats.fromJson(Map<String, dynamic> json){
    return weaponAttackStats(
      json['attack'],
      json['attack']["amount"],
      json['attack'],
      json['attack'],
      json['attack'],
      json['attack'],
      json['attack'],
      json['attack'],
      json['attack'],
      json['attack'],
      json['attack'],
      json['attack'],
      json['attack'],
      json['attack'],
    );
  }

  String? getAttack() => _attack;
  String? getAName() =>_aName;
  String? getAPhy() => _aPhy;
  int? getAPhyAmount() => _aPhyamount;
  String? getAMag() => _aMag;
  int? getAMagAmount() => _aMagamount;
  String? getAFire() => _aFire;
  int? getAFireamount() => _aFireamount;
  String? getALigh() => _aLigh;
  int? getALighAmount() => _aLighamount;
  String? getAHoly() => _aHoly;
  int? getAHolyAmount() => _aHolyamount;
  String? getACrit() => _aCrit;
  int? getACritAmount() => _aCritamount;
}
*/