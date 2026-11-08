enum AdCategory { newTruck, usedTruck, bodyParts }

class AdListing {
  const AdListing({
    required this.id,
    required this.title,
    required this.price,
    required this.location,
    required this.year,
    required this.mileageKm,
    required this.imageAsset,
    required this.category,
  });

  final String id;
  final String title;
  final String price;
  final String location;
  final int year;
  final int mileageKm;
  final String imageAsset;
  final AdCategory category;

  String get detailsLabel => '$year | ${_formatKm(mileageKm)}';

  static String _formatKm(int km) {
    final s = km.toString();
    if (s.length <= 3) return '$s km';
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return '${buf.toString()} km';
  }
}
