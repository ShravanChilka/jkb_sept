import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_model.dart';
import 'package:jkb_sept/modules/wallpaper/view/wallpaper_screen_provider.dart';

class ExploreWallpaperGridViewItem extends StatelessWidget {
  const ExploreWallpaperGridViewItem({
    super.key,
    required this.wallpaper,
  });

  final WallapaperModel wallpaper;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WallpaperScreenProvider(
            model: wallpaper,
          ),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              wallpaper.src.medium,
            ),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.white60,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      wallpaper.photographer,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white60,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  wallpaper.alt,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
