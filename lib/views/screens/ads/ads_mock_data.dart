import '../../../models/ad_listing.dart';
import '../../../utils/app_constants.dart';

abstract final class AdsMockData {
  AdsMockData._();

  static const _titles = [
    'Toyota Hilux 2022',
    'Hino 500 Series 2021',
    'Isuzu NPR 2020',
    'Ford Ranger 2023',
  ];

  static const _locations = ['Lahore', 'Karachi', 'Islamabad', 'Faisalabad'];
  static const _prices = [
    'PKR 495.0 lacs',
    'PKR 620.0 lacs',
    'PKR 380.5 lacs',
    'PKR 710.0 lacs',
  ];

  static List<AdListing> forCategory(AdCategory category) {
    return List.generate(4, (i) {
      return AdListing(
        id: '${category.name}_$i',
        title: _titles[i],
        price: _prices[i],
        location: _locations[i],
        year: 2022 - (i % 3),
        mileageKm: 156856 - (i * 12400),
        imageAsset: i.isEven ? AppConstants.truck1Asset : AppConstants.truck2Asset,
        category: category,
      );
    });
  }
}
