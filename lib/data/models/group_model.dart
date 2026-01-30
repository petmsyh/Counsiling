class GroupModel {
  final String id;
  final String name;
  final String moderatorId;
  final List<String> participantIds;
  final DateTime createdAt;
  final bool isActive;

  GroupModel({
    required this.id,
    required this.name,
    required this.moderatorId,
    required this.participantIds,
    required this.createdAt,
    this.isActive = true,
  });

  factory GroupModel.fromMap(Map<String, dynamic> map, String id) {
    return GroupModel(
      id: id,
      name: map['name'] ?? '',
      moderatorId: map['moderatorId'] ?? '',
      participantIds: List<String>.from(map['participantIds'] ?? []),
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      isActive: map['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'moderatorId': moderatorId,
      'participantIds': participantIds,
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
    };
  }
}
