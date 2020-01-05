class BusinessCard {
  final String name;

  BusinessCard(this.name);
}

class ConstVal {
  static List<BusinessCard> FAKE_CARDS = <BusinessCard>[
    BusinessCard("123"),
    BusinessCard("223"),
    BusinessCard("323"),
    BusinessCard("423")
  ];
}
