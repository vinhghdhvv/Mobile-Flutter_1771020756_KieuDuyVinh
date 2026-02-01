class FinanceTransaction {
  final String date;
  final String type; // Thu / Chi
  final String category;
  final String description;
  final int amount;
  final String creator;

  FinanceTransaction({
    required this.date,
    required this.type,
    required this.category,
    required this.description,
    required this.amount,
    required this.creator,
  });
}
