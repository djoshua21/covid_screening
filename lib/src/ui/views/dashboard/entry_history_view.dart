import 'package:flutter/material.dart';
import 'package:covid_screening_app/src/core/view_models/entry_history_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class EntryHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EntryHistoryViewModel>.reactive(
      viewModelBuilder: () => EntryHistoryViewModel(),
      onModelReady: (model) => model.getEntries(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Center(child: Text('Entries'))),
        body: model.entryList == null
            ? Center(child: CircularProgressIndicator())
            : model.entryList.length == 0
                ? Center(child: Text('No Entry History'))
                : ListView.builder(
                    itemCount: model.entryList.length,
                    itemBuilder: (ctx, i) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: ListTile(
                          onTap: () {
                            //For Testing
                            print(model.entryList[i].location);
                          },
                          title: Text(
                            "Haefele ${model.entryList[i].location} Office",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              DateFormat('d/M').format(
                                model.entryList[i].dateTime,
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              DateFormat.Hm().format(
                                model.entryList[i].dateTime,
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
