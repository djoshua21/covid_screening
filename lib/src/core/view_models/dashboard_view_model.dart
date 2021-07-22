import 'package:haefele_health_app/src/ui/views/dashboard/entry_history_view.dart';
import 'package:haefele_health_app/src/ui/views/dashboard/profile_view.dart';
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
