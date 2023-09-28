class CheckoutState {
  final String email;
  final String mobilephone;
  final String address;

  CheckoutState({
    this.email = '',
    this.mobilephone = '',
    this.address = '',
  });

  CheckoutState copyWith({
    String? email,
    String? mobilephone,
    String? address,
  }) {
    return CheckoutState(
      email: email ?? this.email,
      mobilephone: mobilephone ?? this.mobilephone,
      address: address ?? this.address,
    );
  }
}
