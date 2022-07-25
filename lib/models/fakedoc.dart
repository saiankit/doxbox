class FakeDocument {
  final String title;
  final Map<String, String> primaryDetail;
  final List<Map<String, String>>? details;
  final bool isFavorite;

  FakeDocument({
    required this.title,
    required this.primaryDetail,
    this.details,
    this.isFavorite = false,
  });
}

List<FakeDocument> fakeDocuments = [
  FakeDocument(
    title: 'AADHAR CARD',
    primaryDetail: {'Number': '639209349742'},
    isFavorite: true,
    details: [
      {'Name': 'Battula Venkata Sai Ankit'}
    ],
  ),
  FakeDocument(
    title: ' CARD',
    primaryDetail: {'Number': '639209349742'},
    isFavorite: true,
    details: [
      {'Name': 'Battula Venkata Sai Ankit'}
    ],
  ),
  FakeDocument(
    title: 'Pan CARD',
    primaryDetail: {'Number': 'FBAPB6430B'},
    isFavorite: false,
    details: [
      {'Name': 'Battula Venkata Sai '}
    ],
  ),
];
