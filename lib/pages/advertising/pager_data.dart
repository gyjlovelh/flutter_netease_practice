final pagerList = [
  PagerModel(
    imageUrl: "assets/image/first.png",
    title: '寻找',
    subtitle: "是你吗？\n和我一样喜欢音乐的朋友"
  ),
  PagerModel(
    imageUrl: "assets/image/second.png",
    title: '探索',
    subtitle: "在音乐的世界\n永远充满期待"
  ),
  PagerModel(
    imageUrl: "assets/image/third.png",
    title: '沟通',
    subtitle: "用音乐绘制语言\n让交流充满热忱"
  ),
];

class PagerModel {
  String imageUrl;
  String title;
  String subtitle;
  
  PagerModel({this.imageUrl, this.title, this.subtitle});
}
