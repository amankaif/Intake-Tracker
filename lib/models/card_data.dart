class CardItem {
  final String urlImage;
  final String title;
  final String time;

  const CardItem({
    required this.urlImage,
    required this.title,
    required this.time,
  });
}

List<CardItem> items = [
  const CardItem(
    urlImage: 'assets/images/breakfast.jpg',
    title: 'BreakFast',
    time: '8:00 AM to 9:15 AM',
  ),
  const CardItem(
    urlImage: 'assets/images/lunch.jpg',
    title: 'Lunch',
    time: '12:30 PM to 2:15 PM',
  ),
  const CardItem(
    urlImage: 'assets/images/snacks.jpg',
    title: 'Snacks',
    time: '5:15 PM to 6:15 PM',
  ),
  const CardItem(
    urlImage: 'assets/images/dinner.jpg',
    title: 'Dinner',
    time: '8:00 PM to 9:15 PM',
  ),
];
