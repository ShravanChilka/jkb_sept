import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';

class WallapaperResponseModel {
  const WallapaperResponseModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
  });

  factory WallapaperResponseModel.fromMap(Map<String, dynamic> map) {
    return WallapaperResponseModel(
      page: map['page'] as int,
      perPage: map['per_page'] as int,
      photos: (map['photos'] as List)
          .map(
            (e) => WallapaperModel.fromMap(e),
          )
          .toList(),
      totalResults: map['total_results'] as int,
    );
  }

  final int page;
  final int perPage;
  final List<WallapaperModel> photos;
  final int totalResults;
}
