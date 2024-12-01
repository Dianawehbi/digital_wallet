class Coin {
  double rate_usd;
  String name;
  String min_name;

  Coin(
    this.rate_usd,
    this.name,
    this.min_name,
  );

  @override
  String toString() {
    return "1 $min_name = $rate_usd USD";
  }
}

var coins = <String, Coin>{
  'USD': Coin(1, "USD", "USD"),
  'Bitcoin': Coin(96185.8, "Bitcoin", "BTC"),
  'Ethereum': Coin(3568.87, "Ethereum", "ETH"),
  'Tether': Coin(1, "Tether", "USDT"),
  'Solana': Coin(239.72, "Solana", "SOL"),
  'Uniswap': Coin(12.77, "Uniswap", "UNI"),
  'Dai': Coin(0.9999, "Dai", "DAI"),
  'Usdc': Coin(0.9999, "Usdc", "USDC"),
};
