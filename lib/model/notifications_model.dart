class ReceivedNotification {
  int? id;
  String title;
  String? body;
  String? payload;
  String date;
  String image;

  ReceivedNotification(
      {this.id,
      required this.title,
      required this.date,
      required this.body,
      required this.image,
      required this.payload});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'body': body,
      'payload': payload,
      'date': date
      // 'date': date!.toIso8601String()
    };
  }

  factory ReceivedNotification.fromMap(Map<String, dynamic> map) {
    return ReceivedNotification(
        image: map['image'],
        id: map['id'],
        title: map['title'],
        body: map['body'],
        payload: map['payload'],
        date: map['date']
        // date:
        //     map['date'] == null ? DateTime.now() : DateTime.parse(map['date']);
        );
  }
}

List<ReceivedNotification> userNotifications = [
  ReceivedNotification(
    image: 'assets/images/korea.jpg',
    title: 'Myle Mounre mentioned you in a post',
    body: 'Gyeongbokgung',
    date: 'May 5, 2023 at 7:30PM',
    payload:
        'Gyeongbokgung also known as Gyeongbokgung Palace was the main royal palace built in 1395, it is located in northern Seoul, South Korea.It is the largest of the five built by the Joseon dynasty.',
  ),
  ReceivedNotification(
      image: 'assets/images/Jamaica.jpg',
      title: 'Myle Mounre mentioned you in a post',
      body: "Dunn's River Falls and Park",
      date: "May 5, 2023 at 7:30PM",
      payload:
          "960 feet of fun! Dunn's River falls is an astounding flowing falls that extends across more than 183 meters or 960 feet and is one of the most well-loved travel body."),
  ReceivedNotification(
      image: 'assets/images/Ibiza.jpg',
      title: 'Myle Mounre mentioned you in a post',
      body: 'Ibiza',
      date: "May 5, 2023 at 7:30PM",
      payload:
          "Ibiza is well known for its nightlife and electronic dance music club in the summer, which attract large numbers of tourist. The island's government and Spanish Tourist office have worked toward promoting more family-oriented tourism."),
  ReceivedNotification(
      image: 'assets/images/morocco.jpg',
      title: 'Myle Mounre mentioned you in a post',
      body: 'Ksar of Ait-Ben-Haddou',
      date: "May 5, 2023 at 7:30PM",
      payload:
          "The site of the ksar has been fortified since the 11th century and it holds history of the Moroccan earthen clay.Today th ksar itself is only sparsely inhabited by several families.The depopulation over time is a result of the valley's loss of strategic importance in the 20th century."),
];
