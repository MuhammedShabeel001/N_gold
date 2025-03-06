class SpotRate {
  final String? id;
  final String symbol;
  final double currentPrice;
  final double changePercentage;
  final String? lastUpdated;

  SpotRate({
    this.id,
    required this.symbol,
    required this.currentPrice,
    required this.changePercentage,
    this.lastUpdated,
  });

  factory SpotRate.fromJson(Map<String, dynamic> json) {
    return SpotRate(
      id: json['_id'] ?? json['id'],
      symbol: json['symbol'] ?? 'N/A',
      currentPrice: _parseDouble(json['currentPrice']),
      changePercentage: _parseDouble(json['changePercentage']),
      lastUpdated: json['lastUpdated'] ?? DateTime.now().toIso8601String(),
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'symbol': symbol,
      'currentPrice': currentPrice,
      'changePercentage': changePercentage,
      'lastUpdated': lastUpdated,
    };
  }
}
