import 'package:covid_screening_app/src/ui/views/entries/entry_history_view.dart';
import 'package:covid_screening_app/src/ui/views/dashboard/profile_view.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  final pages = [
    EntryHistoryView(),
    ProfileView(),
  ];

  int currentPage = 0;

  void setPage(index) {
    currentPage = index;
    notifyListeners();
  }
}
