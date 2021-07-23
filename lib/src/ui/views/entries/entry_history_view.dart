import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/constants/route_constants.dart';
import 'package:haefele_health_app/src/core/models/entry_model.dart';
import 'package:haefele_health_app/src/core/view_models/entry_history_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class EntryHistoryView extends StatelessWidget {
  void _showSingleEntry(BuildContext ctx, EntryModel entry) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('Entry', textAlign: TextAlign.center, style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(Icons.calendar_today_sharp),
              title: Text(DateFormat('d MMMM y').format(entry.dateTime)),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text(DateFormat.Hm().format(entry.dateTime)),
            ),
            ListTile(
                leading: Icon(Icons.home_work_outlined),
                title: Text("Haefele ${entry.location} Office")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Dismiss"))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EntryHistoryViewModel>.reactive(
      viewModelBuilder: () => EntryHistoryViewModel(),
      onModelReady: (model) => model.getEntries(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Center(child: Text('Entries'))),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).pushNamed(RoutePaths.addEntry);
            model.getEntries();
          },
        ),
        body: model.entryList == null
            ? Center(child: CircularProgressIndicator())
            : model.entryList.length == 0
                ? Center(child: Text('No Entry History'))
                : ListView.builder(
                    itemCount: model.entryList.length,
                    itemBuilder: (ctx, i) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: ListTile(
                          onTap: () {
                            _showSingleEntry(ctx, model.entryList[i]);
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
