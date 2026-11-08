import '../../../models/blog_post.dart';
import '../../../utils/app_constants.dart';

abstract final class BlogMockData {
  BlogMockData._();

  static final List<BlogPost> initial = [
    BlogPost(
      id: '1',
      title: 'How to Choose the Right Commercial Truck',
      excerpt:
          'A practical guide for fleet owners comparing payload, fuel economy, and total cost of ownership.',
      content:
          'Choosing the right commercial truck starts with understanding your routes, cargo type, and maintenance budget. '
          'Evaluate engine options, axle ratings, and after-sales support from dealers before you commit.\n\n'
          'On Lorry Adda, verified listings help you compare used and new inventory side by side so you can negotiate with confidence.',
      imageAsset: AppConstants.truck1Asset,
      publishedAt: DateTime(2025, 5, 12),
      author: 'Lorry Adda Team',
    ),
    BlogPost(
      id: '2',
      title: 'Used Truck Market Trends in Pakistan',
      excerpt:
          'Demand for 6–10 ton rigs is rising ahead of the harvest season. Here is what sellers should know.',
      content:
          'The used truck market continues to favour well-maintained Japanese and local brands with complete service records. '
          'Sellers who upload clear photos and honest mileage reports close deals faster.\n\n'
          'We are seeing stronger interest in refrigerated and flatbed configurations across Punjab and Sindh.',
      imageAsset: AppConstants.truck2Asset,
      publishedAt: DateTime(2025, 5, 8),
      author: 'Market Desk',
    ),
    BlogPost(
      id: '3',
      title: 'Inspection Checklist Before You List',
      excerpt:
          'Use this checklist to prepare your vehicle and pass inspection on the first attempt.',
      content:
          'Before listing on Lorry Adda, walk through brakes, tyres, lights, and chassis rust. '
          'Document recent repairs and keep registration papers ready for buyers.\n\n'
          'Our inspection team focuses on safety-critical items so buyers trust every ad they see.',
      imageAsset: AppConstants.slider1Asset,
      publishedAt: DateTime(2025, 4, 28),
      author: 'Inspection Ops',
    ),
    BlogPost(
      id: '4',
      title: 'Financing Options for Small Fleet Owners',
      excerpt:
          'Overview of leasing, bank finance, and dealer plans available to logistics startups.',
      content:
          'Small fleet owners can mix short-term leasing with traditional bank finance depending on utilization. '
          'Compare APR, balloon payments, and early exit fees before signing.\n\n'
          'Lorry Adda partners share updated finance programs in the news feed each quarter.',
      imageAsset: AppConstants.truck1Asset,
      publishedAt: DateTime(2025, 4, 15),
      author: 'Lorry Adda Team',
    ),
  ];
}
