import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetImage extends StatelessWidget {
  String imgUrl;
  NetImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            // colorFilter: ColorFilter.mode(
            //     Colors.red, BlendMode.colorBurn)
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
          width: MediaQuery.sizeOf(context).height * 0.2,
          child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
