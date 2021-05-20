class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Karikku',
  profileImageUrl:
      'https://is4-ssl.mzstatic.com/image/thumb/Podcasts124/v4/07/7f/b6/077fb6ad-aca2-5ef2-20c0-1b5abb3e8b6c/mza_4281893551117079457.jpg/600x600wp.png',
  subscribers: '6.28M',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Ripper - The Wanted Killer ft. @Karikku | Irul | Netflix India',
    thumbnailUrl: 'https://www.nghenhachay.net/image/ajJIRFZZMlBZSkU/mqdefault.jpg',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '100K',
    likes: '958',
    dislikes: '4',
  ),
  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title:
        'FAMILY PACK | Karikku | Comedy',
    thumbnailUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ12buSnWHsrHdjSTmoj8ZlP3787DMSU9Q_Qg&usqp=CAU',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: 'Smile Please! | Comedy | Karikku',
    thumbnailUrl: 'https://i.ytimg.com/vi/UCvtDJexUE8/maxresdefault.jpg',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Mr.Pishuku Kumar | Karikku | Comedy',
    thumbnailUrl: 'https://i.pinimg.com/564x/8b/4b/d9/8b4bd9174f45d5de222a93d78de361d9.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'JILLAM JILLALA HONEYBEE 2 Celebrations Official Music Video | Asif Ali | Balu | Bhasi | Bhavana |',
    thumbnailUrl: 'https://i.ytimg.com/vi/XqcoLh40yVI/maxresdefault.jpg',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    dislikes: '45',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'PK | Comedy | Karikku',
    thumbnailUrl: 'https://i.ytimg.com/vi/HOwa8uJZibw/maxresdefault.jpg',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '358K',
    likes: '20k',
    dislikes: '85',
  ),
];
