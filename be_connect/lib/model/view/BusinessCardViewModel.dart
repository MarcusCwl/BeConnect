class BusinessCardViewModel {
  final String name;

  BusinessCardViewModel(this.name);
}

class ConstVal {
  static List<BusinessCardViewModel> FAKE_CARDS = <BusinessCardViewModel>[
    BusinessCardViewModel("123"),
    BusinessCardViewModel("223"),
    BusinessCardViewModel("323"),
    BusinessCardViewModel("423")
  ];
}
