import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/view_models/dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) => Scaffold(
        body: model.pages[model.currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentPage,
          onTap: (index) {
            model.setPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Entries',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
