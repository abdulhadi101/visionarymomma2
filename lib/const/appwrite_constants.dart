class AppwriteConstants{

  static const String databaseId = '64a2bf9a7cf502fa453c';
  static const String projectId = '649476eccbabdac08b6b';
  static const String endPoint = 'http://192.168.26.38:80/v1';
  static const String usersCollection = '64a2bfe55888356af4a0';
  static const String chatsCollection = '64a2c16daf7415b1d326';
  static const String roomsCollection = '64a2c17e44c99a930056';
  static const String resourceHubsCollection = '64a2c19b4af4c2fbea9e';
  static const String momaEventsCollection = '64a2c1b2b67577ff72e9';

  static const String notificationsCollection = '64a2c1c4a558968c8c6a';
  static const String imagesBucket = '64a2c1fa95f5275c032d';
  static const String resourceBucket = '64a2c23bf2ec9dbe47c5';
  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';


}
