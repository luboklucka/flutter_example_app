import 'package:flutter_example_app/src/features/universities/model/university.dart';
import 'package:flutter_example_app/src/features/universities/store/api_service_universities.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements ApiService {
  MockApiService({required this.universities});

  List<University> universities;

  @override
  Future<List<University>> fetchUniversities() async {
    return universities;
  }
}
