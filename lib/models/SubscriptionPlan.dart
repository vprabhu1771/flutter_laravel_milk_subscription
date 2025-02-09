class SubscriptionPlan {
  final int id;
  final String name;
  final String price;
  final int duration;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'duration': duration,
    };
  }
}
