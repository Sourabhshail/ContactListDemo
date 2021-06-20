import 'package:contacts_list/ContactDetails.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

TextEditingController _textController = TextEditingController();

final contacts = <String>[
  'Marco Franco',
  'Raul Alday',
  'Jessica Alba',
  'Roger Waters',
  'Darth Vader',
  'Homer Simpson',
  'Bill Gates',
  'Elon Musk',
  'Enrique Peña',
  'Angeles Rodriguez',
  'Monica Alvarado',
  'Estrella Fugaz',
  'Juana Lopez',
];

Map _elements1, _elements11;
List<Map<String, String>> userContacts = [];
List<Map<String, String>> newDataList = List.from(userContacts);

class _ContactListState extends State<ContactList> {
  void onItemChanged(String value) {
    if (value != "") {
      List<Map<String, String>> userContactsTemp = [];
      for (var map in userContacts) {
        if (map["name"]
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase())) {
          _elements11 = Map<String, String>();
          _elements11['name'] = map['name'];
          _elements11['group'] = map['group'];
          userContactsTemp.add(_elements11);
        }
      }
      setState(() {
        userContacts = userContactsTemp;
        print(userContacts.toString());
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    for (var name in contacts) {
      _elements1 = Map<String, String>();
      _elements1['name'] = name;
      _elements1['group'] = name.substring(0, 1);
      userContacts.add(_elements1);
    }
    print(userContacts.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Container(height: 50,padding: const EdgeInsets.all(8.0),
              color: Colors.blue,
              alignment: Alignment.center, child: Center(child: Text("Header"))),
          Expanded(
            child: GroupedListView<dynamic, String>(

              elements: userContacts,
              groupBy: (element) => element['group'],
              groupComparator: (value1, value2) => value2.compareTo(value1),
              itemComparator: (item1, item2) =>
                  item1['name'].compareTo(item2['name']),
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              itemBuilder: (c, element) {
                return Card(
                  elevation: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    child: ListTile(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactDetails(element['name']),
                            ));
                      },
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle),
                      title: Text(element['name']),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(height: 50, padding: const EdgeInsets.all(8.0),
              color: Colors.blue,
              alignment: Alignment.center,child: Center(child: Text("Footer"))),
        ]),
      ),
    );
  }
}
