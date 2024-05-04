import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model/Create_respons.dart';
import 'Model/Userlist_Model.dart';

class Create_Note extends StatefulWidget {
  const Create_Note({super.key});

  @override
  State<Create_Note> createState() => _Create_NoteState();
}

class _Create_NoteState extends State<Create_Note> {
  String? _selectedValue;
  User? _selectedUser;
  final TextEditingController remarks = TextEditingController();

  bool isVisible = true;
  final List<String> _items = ['Public', 'Private'];
  List<User> userlist = [];

  Future<void> createnote() async {
    String uri = 'https://royalsofterp.com/testing/api/v1/project/create-notes';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer 367|6eIaFyiEjDiABhQAwMjECC1ywvvdDFFZ9oWOyT07aa2d56e0',
      'Company-Master-Key': 'develop',
      'User-Master-Device-Type': 'android'
    };

    var body = {
      'deleteAttachmentArray': '',
      'actionType': 'adminInquiryFollowup',
      'projectId': '208',
      'clientId': '1185',
      'projectTypeId': '418',
      'productId': '0',
      'notesDate': '2024-05-02',
      'notesType': 'Public',
      'remark': remarks.text,
      'notesActionType': '',
      'arrayUserIds': '[]',
      'isAddDailyReport': 'false',
      'areaName':
          'Building 43, 1600 Amphitheatre Pkwy Building 43, Santa Clara County, California, United States, 94043',
      'areaLatitude': '37.4219983',
      'areaLongitude': '-122.084',
      'erpAttachmentRequestJson': ''
    };

    final response = await http.post(Uri.parse(uri),
        headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      //var message = fromJson();
      var noteResponse = Response.fromJson(data);
      print(noteResponse.message);

      showdialog(noteResponse.message);

     // print(data);
    }
  }

  Future<List<User>> userList(_selectedUser) async {
    var headers = {
      'Authorization':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJjb21wYW55TWFzdGVyS2V5IjoiZGV2ZWxvcCIsInVzZXJNYXN0ZXJJZCI6IjMiLCJ1c2VyTWFzdGVyRGV2aWNlVHlwZSI6IndlYiIsInVzZXJNYXN0ZXJEZXZpY2VJZCI6IjY2MzM3N2QzOGNlYmUiLCJ1c2VyTWFzdGVyRGV2aWNlVG9rZW4iOiIiLCJjYWxsRnJvbSI6InN5c3RlbSIsImlhdCI6MTcxNDY0OTA1OSwiZXhwIjoxNzE1NTEzMDU5LCJsb2dpbldlYklkIjoiZTc5ZDhlOTdjMzA3MzJkMjNkNWQ4Zjg1NmEwZWNjNDAiLCJpc01hc3RlciI6ZmFsc2UsImlzQWRtaW4iOmZhbHNlfQ.ku5NaImvDuRiVS36eq0Ptpgj_3Bwi0SKTzaDoVICI4ZMHSj-KmhcbS5LMI_PdxVw7qO_Wz293wp3MaaVNqji4Wmyr-6yOFMqy6NtCAT0pNnCsFpVIT5P4z67g28PvyOC6aerYg-8MaCj53s-ibciJce9w1DIpvsuPIHJG0n8s7yOM1oBGvW75BjFtoJzHiab2w0vXBQ8T6iRniJrAiaIIuB5Tf4IRsizYkqI1TyoASybK-iVpgWLXjC1fOW6K_pIQ0lJX5QvQSVbX6EWyUlLtrsx-xiCUYnfT1VpnJIkTDd3ii_YNajkUqzYxz4jOUFiB-sZR1_KRI4ZBBG61PwIHw',
      'mobileAccess': 'RoyalERP'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://royalerp.co.in/erp/api/$_selectedUser'));
    request.fields.addAll({
      'systemProject': 'MasterOptions',
      'systemModuleFunction': 'getUserDetails'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
      print(jsonResponse);

      Userlist data = Userlist.fromJson(jsonResponse);
      userlist = data.result!.user!;
      // print(await response.stream.bytesToString());
      print(userlist.length.toString());
      return userlist;
    } else {
      print(response.reasonPhrase);
      return userlist;
    }
  }

  final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: Colors.blue, // Customize border color here
      width: 1.0,
    ),
  );

  showdialog(String message){
    showDialog<String>(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Confirm Create Note'),
          content:  Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context, 'OK');
                //createnote();
              },
              child: Text("OK"),
            ),
          ],
        );
      }
    );
  }

  @override
  void initState() {
    super.initState();
    userList(_selectedUser);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Note"),
      ),
      body: Column(
        children: [
          DropdownButtonFormField<String>(
            value: _selectedValue,
            hint: Text('Note Type.'),
            decoration: InputDecoration(
                border: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0)),
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
                if (_selectedValue == "Public") {
                  isVisible = false;
                } else if (_selectedValue == "Private") {
                  isVisible = true;
                }
              });
            },
            items: _items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
            visible: isVisible,
              child: DropdownButtonFormField<User>(
                hint: Text("Select User"),
                decoration: InputDecoration(
                  border: _border,
                  enabledBorder: _border,
                  focusedBorder: _border,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                ),
                value: _selectedUser,
                onChanged: (newValue) {
                  setState(() {
                    _selectedUser = newValue as User;
                    print(_selectedUser!.userName);
                    userList(_selectedUser);
                  });
                },
                items: userlist.map<DropdownMenuItem<User>>((user) {
                  return DropdownMenuItem<User>(
                    value: user,
                    child: Text(user.userName!),
                  );
                }).toList(),
              ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'AMBICA',
                border: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0)),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'New Project Data',
                border: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0)),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: remarks,
            decoration: InputDecoration(
                border: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                hintText: 'Remark',
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0)),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {
            setState(() {
              createnote();
            });
          }, child: Text('Submit'))
        ],
      ),
    );
  }
}
