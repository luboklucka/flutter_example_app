import 'package:app_example_flutter/src/features/universities/model/university.dart';
import 'package:app_example_flutter/src/features/universities/store/api_service_universities.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements ApiService {
  MockApiService({required this.universities});

  List<University> universities;

  @override
  Future<List<University>> fetchUniversities() async {
    return universities;
  }
}
