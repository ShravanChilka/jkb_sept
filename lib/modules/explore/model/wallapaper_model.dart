import 'package:jkb_sept/modules/explore/model/wallpaper_url_model.dart';

class WallapaperModel {
  const WallapaperModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.alt,
  });

  factory WallapaperModel.fromMap(Map<String, dynamic> map) {
    return WallapaperModel(
      id: map['id'] as int,
      width: map['width'] as int,
      height: map['height'] as int,
      url: map['url'] as String,
      photographer: map['photographer'] as String,
      photographerUrl: map['photographer_url'] as String,
      photographerId: map['photographer_id'] as int,
      avgColor: map['avg_color'] as String,
      src: WallpaperUrlModel.fromMap(map['src'] as Map<String, dynamic>),
      alt: map['alt'] as String,
    );
  }

  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final WallpaperUrlModel src;
  final String alt;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'avg_color': avgColor,
      'src': src.toMap(),
      'alt': alt,
    };
  }
}

/**
 * 
{id: 30419681, width: 3024, height: 4032, url: https://www.pexels.com/photo/cozy-setup-with-book-coffee-and-cake-on-wooden-table-30419681/, photographer: Tuğçe Gül, photographer_url: https://www.pexels.com/@tugce-gul-2149079650, photographer_id: 2149079650, avg_color: #95836F, src: {original: https://images.pexels.com/photos/30419681/pexels-photo-30419681.jpeg, large2x: https://images.pexels.com/photos/30419681/pexels-photo-30419681.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940, large: https://images.pexels.com/photos/30419681/pexels-photo-30419681.jpeg?auto=compress&cs=tinysrgb&h=650&w=940, medium: https://images.pexels.com/photos/30419681/pexels-photo-30419681.jpeg?auto=compress&cs=tinysrgb&h=350, small: https://images.pexels.com/photos/30419681/pexels-photo-30419681.jpeg?auto=compress&cs=tinysrgb&h=130, portrait: https://images.pexels.com/photos/30419681/pexels-photo-30419681.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800, landscape: https://images.pexels.com/photos/30419681/pexels-photo-30419681.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200, tiny: https://images.pexels.com/photos/30419681/pexels-photo-30419681.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280}
 */
