import '../models/inspection_request.dart';
import '../views/screens/inspections/inspection_mock_data.dart';

abstract final class InspectionRepository {
  InspectionRepository._();

  static final List<InspectionRequest> items = List.from(InspectionMockData.initial);

  static InspectionRequest? findById(String id) {
    for (final item in items) {
      if (item.id == id) return item;
    }
    return null;
  }
}
