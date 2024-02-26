class Recruit {
  final int? recruitNo;
  final String? recruitUid;
  final String? writerId;
  final String? recruitThumbnail;
  String? recruitTitle;
  final bool? isAnonymous;
  final DateTime? createdAt;
  DateTime? updatedAt;
  final DateTime? deletedAt;

  Recruit({
    this.recruitNo,
    this.recruitUid,
    this.writerId,
    this.recruitThumbnail,
    this.recruitTitle,
    this.isAnonymous,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
