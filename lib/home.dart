import 'package:dialog_listview/homeProvider.dart';
import 'package:dialog_listview/reusableWidge.dart';
import 'package:dialog_listview/secondDialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: dialog(context)
      ),
    );
  }


  dialog(BuildContext context){

    final itmes = ['laptop','coffee','music'];
    final HomeProvider value = Provider.of<HomeProvider>(context);

    return AlertDialog(
      title: Text('Select'),
      content: SizedBox(
        height: value.updateDialogHeight,
        child: Column(
          children: [

            ListTile(
              trailing: IconButton(
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                onPressed: () {
                  value.expandDialog=!value.isClick;
                  print('click');
                },
              ),
              title: Text(value.name),
            ),

            value.isClick
                ? Flexible(
              child: SizedBox(
                width: 250,
                //height: 130,
                child: ListView.builder(
                    itemCount: itmes.length,
                    itemBuilder: (context, index){
                      return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.0,bottom: 5.0,left: 10.0),
                            child: RadioListTile(
                              title: Text(itmes[index]),
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: index,
                              groupValue: value.groupValue,
                              onChanged: (val){
                                value.updateName = itmes[index];
                                value.groupValue = val!;
                              },
                            ),
                          )
                      );
                    }
                ),
              ),
            )
                : SizedBox(width: 0,height: 0,),
          ],
        ),
      ),
      actions: [
        textButton('save',(){
          Navigator.push(context, MaterialPageRoute(builder: (_) => ChangeNotifierProvider<HomeProvider>(
              create: (_) => HomeProvider(),
              child: SecondDailog()))
          );
        }),
        textButton('cancel',(){
          value.expandDialog=false;
        }),
      ],
    );
  }

}
