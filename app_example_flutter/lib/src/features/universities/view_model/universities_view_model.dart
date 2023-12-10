import 'package:app_example_flutter/src/features/universities/store/api_service_universities.dart';
import 'package:app_example_flutter/src/features/universities/model/university.dart';
import 'package:flutter/foundation.dart';

class UniversitiesViewModel extends ChangeNotifier {
  UniversitiesViewModel({
    required this.apiService,
  });

  ApiService apiService;
  List<University> universities = [];
  String fetchErrorMessage = "";

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> fetchSortedUniversities() async {
    isLoading = true;

    try {
      var unis = await apiService.fetchUniversities();
      unis.sort((a, b) => (a.name ?? "a").compareTo((b.name ?? "b")));
      universities = unis;
    } catch (e) {
      /* TODO: This is a shortcut. In a real world app, we would not display every exception 
               that can be thrown, but instead choose few of the possible network exceptions and 
               display error for only those.
      */
      fetchErrorMessage = e.toString();
    }

    isLoading = false;
    return;
  }
}
