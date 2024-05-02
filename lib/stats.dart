import 'dart:convert';
import 'dart:math';
import 'package:final_project/profile.dart';
import 'package:powers/powers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'weapons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class character {
  var lvl = 0;
  var vigor = 0;
  var mind = 0;
  var end = 0;
  var str = 0;
  var dex = 0;
  var inte = 0;
  var faith = 0;
  var arc = 0;
  var newlvl = 0;
  var newvigor = 0;
  var newmind = 0;
  var newend = 0;
  var newstr = 0;
  var newdex = 0;
  var newinte = 0;
  var newfaith = 0;
  var newarc = 0;
  var hp = 0;
  var fp = 0;
  var st = 0;

  character(
      this.lvl,
      this.vigor,
      this.mind,
      this.end,
      this.str,
      this.dex,
      this.inte,
      this.faith,
      this.arc,
      this.newlvl,
      this.newvigor,
      this.newmind,
      this.newend,
      this.newstr,
      this.newdex,
      this.newinte,
      this.newfaith,
      this.newarc,
      this.hp,
      this.fp,
      this.st); //I added this. for hp, fp, and st
}

class stats extends StatefulWidget {
  @override
  State<stats> createState() => _StatsScreen();
}

class _StatsScreen extends State<stats> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _charFieldController = TextEditingController();
  @override
  String dropdownValue = 'Hero';
  List hero = [7, 14, 9, 12, 16, 9, 7, 8, 11];
  List bandit = [5, 10, 11, 10, 9, 13, 9, 8, 14];
  List astrologer = [6, 9, 15, 9, 8, 12, 16, 7, 9];
  List warrior = [8, 11, 12, 11, 10, 16, 10, 8, 9];
  List prisoner = [9, 11, 12, 11, 11, 14, 14, 6, 9];
  List confessor = [10, 10, 13, 10, 12, 12, 9, 14, 9];
  List wretch = [1, 10, 10, 10, 10, 10, 10, 10, 10];
  List vagabond = [9, 15, 10, 11, 14, 13, 9, 9, 7];
  List prophet = [7, 10, 14, 8, 11, 10, 7, 16, 10];
  List samurai = [9, 12, 11, 13, 12, 15, 9, 8, 8];

  var lvl = 7;
  var vigor = 14;
  var mind = 9;
  var end = 12;
  var str = 16;
  var dex = 9;
  var inte = 7;
  var faith = 8;
  var arc = 11;

  var newlvl = 7;
  var newvigor = 14;
  var newmind = 9;
  var newend = 12;
  var newstr = 16;
  var newdex = 9;
  var newinte = 7;
  var newfaith = 8;
  var newarc = 11;

  var _lvl = 0;
  var _vigor = 0;
  var _mind = 0;
  var _end = 0;
  var _str = 0;
  var _dex = 0;
  var _inte = 0;
  var _faith = 0;
  var _arc = 0;
  var _newlvl = 0;
  var _newvigor = 0;
  var _newmind = 0;
  var _newend = 0;
  var _newstr = 0;
  var _newdex = 0;
  var _newinte = 0;
  var _newfaith = 0;
  var _newarc = 0;
  var _hp = 0;
  var _fp = 0;
  var _st = 0;

  var lvlD = 0;
  double runes = 0;
  double totalR = 0;

  var hp = 396;
  var fp = 65;
  var st = 90;

  save() async {
    print('dsvref');
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('lvl', lvl);
    prefs.setInt('vigor', vigor);
    prefs.setInt('mind', mind);
    prefs.setInt('end', end);
    prefs.setInt('str', str);
    prefs.setInt('dex', dex);
    prefs.setInt('inte', inte);
    prefs.setInt('faith', faith);
    prefs.setInt('hp', hp);
    prefs.setInt('fp', fp);
    prefs.setInt('st', st);
    prefs.setInt('arc', arc);
    prefs.setInt('nlvl', newlvl);
    prefs.setInt('nvigor', newvigor);
    prefs.setInt('nmind', newmind);
    prefs.setInt('nend', newend);
    prefs.setInt('nstr', newstr);
    prefs.setInt('ndex', newdex);
    prefs.setInt('ninte', newinte);
    prefs.setInt('nfaith', newfaith);
    prefs.setInt('narc', newarc);
  }

  retrieve() async {
    print('retuerbdsf');
    var prefs = await SharedPreferences.getInstance();
    _lvl = prefs.getInt('lvl') ?? 0;
    _vigor = prefs.getInt('vigor') ?? 0;
    _mind = prefs.getInt('mind') ?? 0;
    _end = prefs.getInt('end') ?? 0;
    _str = prefs.getInt('str') ?? 0;
    _dex = prefs.getInt('dex') ?? 0;
    _inte = prefs.getInt('inte') ?? 0;
    _faith = prefs.getInt('faith') ?? 0;
    _arc = prefs.getInt('arc') ?? 0;
    _newlvl = prefs.getInt('nlvl') ?? 0;
    _newvigor = prefs.getInt('nvigor') ?? 0;
    _newmind = prefs.getInt('nmind') ?? 0;
    _newend = prefs.getInt('nend') ?? 0;
    _newstr = prefs.getInt('nstr') ?? 0;
    _newdex = prefs.getInt('ndex') ?? 0;
    _newinte = prefs.getInt('ninte') ?? 0;
    _newfaith = prefs.getInt('nfaith') ?? 0;
    _newarc = prefs.getInt('narc') ?? 0;
    _hp = prefs.getInt('hp') ?? 0;
    _fp = prefs.getInt('fp') ?? 0;
    _st = prefs.getInt('st') ?? 0;

    setState(() {
      lvl = _lvl;
      vigor = _vigor;
      mind = _mind;
      end = _end;
      str = _str;
      dex = _dex;
      inte = _inte;
      faith = _faith;
      arc = _arc;

      newlvl = _newlvl;
      newvigor = _newvigor;
      newmind = _newmind;
      newend = _newend;
      newstr = _newstr;
      newdex = _newdex;
      newinte = _newinte;
      newfaith = _newfaith;
      newarc = _newarc;
    });
  }

  int selected = 0;
  final _pageOptions = [
    stats(),
    weapons(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elden Ring Character Planner'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        key: _formKey,
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text('Name', style: TextStyle(color: Colors.white)),
                ),
                Flexible(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter character Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                    ),
                    controller: _charFieldController,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    'Class',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.grey,
                  value: dropdownValue,
                  //icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.white),
                  /*underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),*/

                  items: <String>[
                    'Hero',
                    'Warrior',
                    'Astrologer',
                    'Bandit',
                    'Prisoner',
                    'Confessor',
                    'Wretch',
                    'Prophet',
                    'Samurai'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      print(dropdownValue);
                      if (dropdownValue == 'Hero') {
                        lvl = hero[0];
                        vigor = hero[1];
                        mind = hero[2];
                        end = hero[3];
                        str = hero[4];
                        dex = hero[5];
                        inte = hero[6];
                        faith = hero[7];
                        arc = hero[8];
                      } else if (dropdownValue == 'Warrior') {
                        lvl = warrior[0];
                        vigor = warrior[1];
                        mind = warrior[2];
                        end = warrior[3];
                        str = warrior[4];
                        dex = warrior[5];
                        inte = warrior[6];
                        faith = warrior[7];
                        arc = warrior[8];
                      } else if (dropdownValue == 'Astrologer') {
                        lvl = astrologer[0];
                        vigor = astrologer[1];
                        mind = astrologer[2];
                        end = astrologer[3];
                        str = astrologer[4];
                        dex = astrologer[5];
                        inte = astrologer[6];
                        faith = astrologer[7];
                        arc = astrologer[8];
                      } else if (dropdownValue == 'Bandit') {
                        lvl = bandit[0];
                        vigor = bandit[1];
                        mind = bandit[2];
                        end = bandit[3];
                        str = bandit[4];
                        dex = bandit[5];
                        inte = bandit[6];
                        faith = bandit[7];
                        arc = bandit[8];
                      } else if (dropdownValue == 'Prisoner') {
                        lvl = prisoner[0];
                        vigor = prisoner[1];
                        mind = prisoner[2];
                        end = prisoner[3];
                        str = prisoner[4];
                        dex = prisoner[5];
                        inte = prisoner[6];
                        faith = prisoner[7];
                        arc = prisoner[8];
                      } else if (dropdownValue == 'Confessor') {
                        lvl = confessor[0];
                        vigor = confessor[1];
                        mind = confessor[2];
                        end = confessor[3];
                        str = confessor[4];
                        dex = confessor[5];
                        inte = confessor[6];
                        faith = confessor[7];
                        arc = confessor[8];
                      } else if (dropdownValue == 'Wretch') {
                        lvl = wretch[0];
                        vigor = wretch[1];
                        mind = wretch[2];
                        end = wretch[3];
                        str = wretch[4];
                        dex = wretch[5];
                        inte = wretch[6];
                        faith = wretch[7];
                        arc = wretch[8];
                      } else if (dropdownValue == 'Prophet') {
                        lvl = prophet[0];
                        vigor = prophet[1];
                        mind = prophet[2];
                        end = prophet[3];
                        str = prophet[4];
                        dex = prophet[5];
                        inte = prophet[6];
                        faith = prophet[7];
                        arc = prophet[8];
                      } else if (dropdownValue == 'Samurai') {
                        lvl = samurai[0];
                        vigor = samurai[1];
                        mind = samurai[2];
                        end = samurai[3];
                        str = samurai[4];
                        dex = samurai[5];
                        inte = samurai[6];
                        faith = samurai[7];
                        arc = samurai[8];
                      }
                      newlvl = lvl;
                      newvigor = vigor;
                      newmind = mind;
                      newend = end;
                      newstr = str;
                      newdex = dex;
                      newinte = inte;
                      newfaith = faith;
                      newarc = arc;
                    });
                  },
                ),
              ],
            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Level',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    lvl.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(newlvl.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_upward,
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_downward,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Vigor',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    vigor.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(newvigor.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print(newvigor);
                      newvigor++;
                      newlvl++;
                      hp = hp + 24;
                      lvlD++;
                      print(lvlD);
                      runes = ((0.02 * (lvlD.cubed())) +
                          (3.12 * (lvlD.squared())) +
                          (111.748 * lvlD) +
                          787);
                      totalR = totalR + runes;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (newvigor == vigor) {
                        print('no');
                      } else if (newvigor > vigor) {
                        newvigor--;
                        newlvl--;
                        lvlD--;
                        hp = hp - 24;
                        totalR = totalR - runes;
                        runes = runes -
                            ((0.02 * (1.cubed())) +
                                (3.12 * (1.squared())) +
                                (111.748 * 1) +
                                787);
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Mind',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    mind.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                  child: Text(newmind.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print(newvigor);
                      newmind++;
                      newlvl++;
                      fp = fp + 3;
                      lvlD++;
                      print(lvlD);
                      runes = ((0.02 * (lvlD.cubed())) +
                          (3.12 * (lvlD.squared())) +
                          (111.748 * lvlD) +
                          787);
                      totalR = totalR + runes;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (newmind == mind) {
                        print('no');
                      } else if (newmind > mind) {
                        newmind--;
                        newlvl--;
                        lvlD--;
                        fp = fp - 3;
                        totalR = totalR - runes;
                        runes = runes -
                            ((0.02 * (1.cubed())) +
                                (3.12 * (1.squared())) +
                                (111.748 * 1) +
                                787);
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Endurance',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text(
                    end.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text(newend.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print(newvigor);
                      newend++;
                      newlvl++;
                      lvlD++;
                      st = st + 24;
                      print(lvlD);
                      runes = ((0.02 * (lvlD.cubed())) +
                          (3.12 * (lvlD.squared())) +
                          (111.748 * lvlD) +
                          787);
                      totalR = totalR + runes;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (newend == end) {
                        print('no');
                      } else if (newend > end) {
                        newend--;
                        newlvl--;
                        lvlD--;
                        st = st - 24;
                        totalR = totalR - runes;
                        runes = runes -
                            ((0.02 * (1.cubed())) +
                                (3.12 * (1.squared())) +
                                (111.748 * 1) +
                                787);
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Strength',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    str.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(newstr.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print(newvigor);
                      newstr++;
                      newlvl++;
                      lvlD++;
                      print(lvlD);
                      runes = ((0.02 * (lvlD.cubed())) +
                          (3.12 * (lvlD.squared())) +
                          (111.748 * lvlD) +
                          787);
                      totalR = totalR + runes;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (newstr == str) {
                        print('no');
                      } else if (newstr > str) {
                        newstr--;
                        newlvl--;
                        lvlD--;
                        totalR = totalR - runes;
                        runes = runes -
                            ((0.02 * (1.cubed())) +
                                (3.12 * (1.squared())) +
                                (111.748 * 1) +
                                787);
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Dexerity',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    dex.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(newdex.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print(newvigor);
                      newdex++;
                      newlvl++;
                      lvlD++;
                      print(lvlD);
                      runes = ((0.02 * (lvlD.cubed())) +
                          (3.12 * (lvlD.squared())) +
                          (111.748 * lvlD) +
                          787);
                      totalR = totalR + runes;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (newdex == dex) {
                        print('no');
                      } else if (newdex > dex) {
                        newdex--;
                        newlvl--;
                        lvlD--;
                        totalR = totalR - runes;
                        runes = runes -
                            ((0.02 * (1.cubed())) +
                                (3.12 * (1.squared())) +
                                (111.748 * 1) +
                                787);
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Intelligence',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    inte.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(newinte.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print(newvigor);
                      newinte++;
                      newlvl++;
                      lvlD++;
                      print(lvlD);
                      runes = ((0.02 * (lvlD.cubed())) +
                          (3.12 * (lvlD.squared())) +
                          (111.748 * lvlD) +
                          787);
                      totalR = totalR + runes;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (newinte == inte) {
                        print('no');
                      } else if (newinte > inte) {
                        newinte--;
                        newlvl--;
                        lvlD--;
                        totalR = totalR - runes;
                        runes = runes -
                            ((0.02 * (1.cubed())) +
                                (3.12 * (1.squared())) +
                                (111.748 * 1) +
                                787);
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Faith',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    faith.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(newfaith.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print(newvigor);
                      newfaith++;
                      newlvl++;
                      lvlD++;
                      print(lvlD);
                      runes = ((0.02 * (lvlD.cubed())) +
                          (3.12 * (lvlD.squared())) +
                          (111.748 * lvlD) +
                          787);
                      totalR = totalR + runes;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (newfaith == faith) {
                        print('no');
                      } else if (newfaith > faith) {
                        newfaith--;
                        newlvl--;
                        lvlD--;
                        totalR = totalR - runes;
                        runes = runes -
                            ((0.02 * (1.cubed())) +
                                (3.12 * (1.squared())) +
                                (111.748 * 1) +
                                787);
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Arcane',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    arc.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(newarc.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print(newvigor);
                      newarc++;
                      newlvl++;
                      lvlD++;
                      print(lvlD);
                      runes = ((0.02 * (lvlD.cubed())) +
                          (3.12 * (lvlD.squared())) +
                          (111.748 * lvlD) +
                          787);
                      totalR = totalR + runes;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (newarc == arc) {
                        print('no');
                      } else if (newarc > arc) {
                        newarc--;
                        newlvl--;
                        lvlD--;
                        totalR = totalR - runes;
                        runes = runes -
                            ((0.02 * (1.cubed())) +
                                (3.12 * (1.squared())) +
                                (111.748 * 1) +
                                787);
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text('Runes Required per Level:',
                      style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(runes.toStringAsFixed(0),
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text('Total Runes:',
                      style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(totalR.toStringAsFixed(0),
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text('HP', style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(hp.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text('FP', style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(fp.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: Text('Stamina', style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: Text(st.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: RaisedButton(
                    child: Text('Save Character'),
                    onPressed: () {
                      save();
                    },
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text('Retrieve Character'),
                    onPressed: () {
                      retrieve();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black54,
    );
  }
}
