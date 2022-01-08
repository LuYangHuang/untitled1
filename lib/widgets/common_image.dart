import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe

final networkUriReg = RegExp('^http');
final localUriReg = RegExp('^static');

/**
 * 图片封装
 */
class CommonImage extends StatelessWidget {
  // late String src;
  // late double width;
  // late double height;
  // late BoxFit fit;
  // CommonImage(this.src, {Key? key, double? width, double? height, BoxFit? fit})
  //     : super(key: key);
/**
 * flutter 2.0以后 空安全的处理方式
 */
  final String src;
  final double? width = null;
  final double? height = null;
  final BoxFit? fit = null;

  const CommonImage(this.src,
      {Key? key, double? width, double? height, BoxFit? fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (networkUriReg.hasMatch(src)) {
      return Image(
        width: width,
        height: height,
        fit: fit,
        image: ExtendedNetworkImageProvider(src,
            cache: true, //启用缓存
            retries: 3, //请求尝试次数
            timeLimit: Duration(minutes: 5),
            timeRetry: Duration(milliseconds: 100)),
      );
    }

    if (localUriReg.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
      );
    }
    assert(false, 'Image src 不合法！');
    return Container();
  }
}
