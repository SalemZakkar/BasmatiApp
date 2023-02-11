import 'package:basic_project/helper/helper_export.dart';
import 'package:basic_project/shared/web_services_export.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget imageHolder(String? url) {
  if (url == null) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Image.asset(
        AppAssets.noImage,
        fit: BoxFit.cover,
      ),
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        imageUrl: "${EndPoints.baseUrl}/static/$url",
        imageBuilder: (context, image) {
          return Image(
            image: image,
            fit: BoxFit.cover,
          );
        },
        placeholder: (context, url) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        errorWidget: (context, url, error) {
          return Center(
            child: Icon(
              Icons.error,
              color: Theme.of(context).errorColor,
            ),
          );
        },
      ),
    );
  }
}
