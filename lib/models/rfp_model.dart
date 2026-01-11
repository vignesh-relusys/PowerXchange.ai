class RFP {
  final String id;
  final String title;
  final String deadline;
  final int bidCount;
  final String status;
  final double budget;

  RFP({
    required this.id,
    required this.title,
    required this.deadline,
    required this.bidCount,
    required this.status,
    required this.budget,
  });

  // Factory to create an RFP object from JSON
  factory RFP.fromJson(Map<String, dynamic> json) {
    return RFP(
      id: json['id'],
      title: json['title'],
      deadline: json['deadline'],
      bidCount: json['bidCount'],
      status: json['status'],
      budget: json['budget'].toDouble(),
    );
  }
}