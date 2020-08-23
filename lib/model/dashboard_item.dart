class DashboardItem{

  String img, name, subtitle;

  DashboardItem({this.img, this.name, this.subtitle});

  @override
  String toString() {
    return 'DashboardItem{img: $img, name: $name, subtitle: $subtitle}';
  }
}