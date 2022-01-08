// import 'package:flutter/material.dart';
//轮播图
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_swiper/flutter_swiper.dart';

// const List<String> defautImages = [
//   'https://tenfei01.cfp.cn/creative/vcg/veer/800water/veer-342491785.jpg',
//   'https://alifei04.cfp.cn/creative/vcg/veer/800water/veer-133223713.jpg',
//   'https://alifei01.cfp.cn/creative/vcg/veer/800water/veer-134169980.jpg',
// ];

// class CommonSwiper extends StatelessWidget {
//   final List<String> images;

//   const CommonSwiper({Key? key, this.images = defautImages}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200.0,
//       child: new Swiper(
//         layout: SwiperLayout.CUSTOM,
//         // customLayoutOption:
//         //     new CustomLayoutOption(startIndex: -1, stateCount: 3)
//         //         .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
//         //   new Offset(-370.0, -40.0),
//         //   new Offset(0.0, 0.0),
//         //   new Offset(370.0, -40.0)
//         // ]),

//         itemBuilder: (context, index) {
//           return new Image.network(
//             images[index],
//             fit: BoxFit.fill,
//           );
//         },
//         itemCount: images.length,
//         pagination: new SwiperPagination(),
//         control: new SwiperControl(),
//       ),
//     );
//   }
// }
