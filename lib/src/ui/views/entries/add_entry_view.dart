import 'package:flutter/material.dart';
import 'package:covid_screening_app/src/core/constants/office_constants.dart';
import 'package:covid_screening_app/src/core/view_models/add_entry_view_model.dart';
import 'package:stacked/stacked.dart';

class AddEntryView extends StatelessWidget {
  final _tempController = TextEditingController();

  @override
  Widget build(BuildContext context) {;
    return ViewModelBuilder<AddEntryViewModel>.reactive(
      viewModelBuilder: () => AddEntryViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Add Entry'),
        ),
        body: SingleChildScrollView(
          child: Container(
            // height: deviceSize.height,
            // width: deviceSize.width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temperature', style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 4),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _tempController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(height: 20),
                Text('Office:', style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text('Choose Location', textAlign: TextAlign.center),
                    value: model.currentOffice ?? null,
                    onChanged: (newPlace) {
                      model.changeOffice(newPlace);
                    },
                    items: [
                      DropdownMenuItem(
                        value: Offices.johannesburg,
                        //onTap: () => model.changeOffice(Offices.johannesburg),
                        child: Text(OfficeConstants.johannesburg),
                      ),
                      DropdownMenuItem(
                        value: Offices.capeTown,
                        //onTap: () => model.changeOffice(Offices.capeTown),
                        child: Text(OfficeConstants.capeTown),
                      ),
                      DropdownMenuItem(
                        value: Offices.australia,
                        //onTap: () => model.changeOffice(Offices.capeTown),
                        child: Text(OfficeConstants.australia),
                      ),
                      DropdownMenuItem(
                        value: Offices.london,
                        //onTap: () => model.changeOffice(Offices.capeTown),
                        child: Text(OfficeConstants.london),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3),
                CheckboxListTile(
                  tileColor: Colors.black12,
                  contentPadding: EdgeInsets.zero,
                  value: model.chk1,
                  title: Text('I show no symptoms of Covid-19'),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    model.chk1 = value;
                    model.notifyListeners();
                  },
                ),
                SizedBox(height: 3),
                CheckboxListTile(
                  tileColor: Colors.black12,
                  contentPadding: EdgeInsets.zero,
                  value: model.chk2,
                  title: Text('I have not been sick for the last 14 days'),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    model.chk2 = value;
                    model.notifyListeners();
                  },
                ),
                SizedBox(height: 3),
                CheckboxListTile(
                  tileColor: Colors.black12,
                  contentPadding: EdgeInsets.zero,
                  value: model.chk3,
                  title: Text(
                      'I have not been in contact with anybody that has tested positive for Covid-19 in the last 14 days'),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    model.chk3 = value;
                    model.notifyListeners();
                  },
                ),
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {
                    if (_tempController.text.isNotEmpty) {
                      model.handleEntry(context, _tempController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
