import 'package:flutter_example_app/src/features/universities/model/university.dart';
import 'package:flutter_example_app/src/features/universities/view_model/universities_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_api_service.dart';

void main() {
  group('Universities ViewModel (ChangeNotifier) tests', () {
    test('fetching sorted universities from ViewModel', () {
      const firstName = 'Hollywood';
      const lastName = 'Vinewood';

      var universities = [
        University(name: lastName, country: 'United States'),
        University(name: "Marywood University", country: 'United States'),
        University(name: firstName, country: 'United States'),
      ];

      final mockApiService = MockApiService(universities: universities);
      final viewModel = UniversitiesViewModel(apiService: mockApiService);

      viewModel.fetchSortedUniversities();

      viewModel.addListener(() {
        expect(viewModel.universities.length, equals(3));
        expect(viewModel.universities.first.name, equals(firstName));
        expect(viewModel.universities.last.name, equals(lastName));
      });
    });
  });
}
