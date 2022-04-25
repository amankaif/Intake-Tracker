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
    urlImage:
        'https://media.istockphoto.com/photos/avocado-toast-with-eggs-and-roasted-tomatoes-picture-id1311507085?b=1&k=20&m=1311507085&s=170667a&w=0&h=Hh8U9cQaCvIGByR7MG70Vx6q4xi4NLue-VX0uJCWWbU=',
    title: 'BreakFast',
    time: '8:00 AM to 9:15 AM',
  ),
  const CardItem(
    urlImage:
        'https://images.unsplash.com/photo-1546793665-c74683f339c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    title: 'Lunch',
    time: '12:30 PM to 2:15 PM',
  ),
  const CardItem(
    urlImage:
        'https://media.istockphoto.com/photos/hot-dogs-for-game-day-picture-id1326146573?b=1&k=20&m=1326146573&s=170667a&w=0&h=QUezIIx1Bi91E9A4dRdaBJMjHNCGjb3GliyfrkDPHqE=',
    title: 'Snacks',
    time: '5:15 PM to 6:15 PM',
  ),
  const CardItem(
    urlImage:
        'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    title: 'Dinner',
    time: '8:00 PM to 9:15 PM',
  ),
];
