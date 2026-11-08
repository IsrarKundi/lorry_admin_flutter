enum InspectionStatus { newRequest, assigned }

class InspectionRequest {
  const InspectionRequest({
    required this.id,
    required this.requestCode,
    required this.vehicleTitle,
    required this.location,
    required this.imageAsset,
    required this.requestedAt,
    required this.status,
    required this.ownerName,
    required this.ownerPhone,
    required this.notes,
    this.inspectorName,
    this.scheduledAt,
  });

  final String id;
  final String requestCode;
  final String vehicleTitle;
  final String location;
  final String imageAsset;
  final DateTime requestedAt;
  final InspectionStatus status;
  final String ownerName;
  final String ownerPhone;
  final String notes;
  final String? inspectorName;
  final DateTime? scheduledAt;
}
