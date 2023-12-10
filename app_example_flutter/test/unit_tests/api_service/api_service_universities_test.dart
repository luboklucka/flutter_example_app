import 'package:app_example_flutter/src/features/universities/model/university.dart';
import 'package:app_example_flutter/src/features/universities/store/api_service_universities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'network_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('ApiTests', () {
    test(
        'fetchUniversities() returns List<University> if the http call completes successfully ',
        () async {
      final mockClient = MockClient();

      final uri = Uri.http(
          'universities.hipolabs.com', '/search', {'country': 'United States'});
      when(mockClient.get(uri)).thenAnswer((_) async => http.Response(
          '[{"country": "United States", "alpha_two_code": "US", "state-province": null, "name": "Marywood University", "web_pages": ["http://www.marywood.edu"], "domains": ["marywood.edu"]}]',
          200));

      final apiService = ApiService(httpClient: mockClient);
      var fetchedUnis = await apiService.fetchUniversities();

      expect(fetchedUnis, isA<List<University>>());
    });
  });
}
