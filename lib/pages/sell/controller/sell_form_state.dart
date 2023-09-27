class SellState {
  final String name;
  final String description;
  final String price;

  SellState({
    this.name = '',
    this.description = '',
    this.price = '0',
  });

  SellState copyWith({
    String? name,
    String? description,
    String? price,
  }) {
    return SellState(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }
}
