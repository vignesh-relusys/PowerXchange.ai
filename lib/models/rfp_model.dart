class RFP {
  final String id;
  final String title;
  final String company;
  final String deadline;
  final int bidCount;
  final String status;
  final double budget;

  RFP({
    required this.id,
    required this.title,
    required this.company,
    required this.deadline,
    required this.bidCount,
    required this.status,
    required this.budget,
  });

  factory RFP.fromJson(Map<String, dynamic> json) {
    return RFP(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      deadline: json['deadline'],
      bidCount: json['bidCount'],
      status: json['status'],
      budget: (json['budget'] as num).toDouble(),
    );
  }
}