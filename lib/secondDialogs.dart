import 'package:dialog_listview/homeProvider.dart';
import 'package:dialog_listview/reusableWidge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondDailog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DialogBox')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _dialog(context),
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }

  _dialog(BuildContext context){
    return showDialog(
        context: context,
      builder: (BuildContext context) {
          return AlertDialog(
            title: Text('select'),
            content: Container(
                height: 260,
                width: double.maxFinite,
                child: listItems(context)
            ),
            actions: [
              textButton('save',(){}),
              textButton('cancel',(){
                Navigator.pop(context);
              }),
            ],
          );
      },
    );
  }

  listItems(BuildContext context){
    final _countries = ['USA', 'Canada', 'Singapore', 'India'];
     final HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return ListView.builder(
        itemCount: _countries.length,
        itemBuilder:(context, index){
          return RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(_countries[index]),
              value: _countries[index],
              groupValue: homeProvider.selectedCountry,
              onChanged: (String? val){
                homeProvider.selectedCountry = val;
              }
          );
        }
    );
  }

}
