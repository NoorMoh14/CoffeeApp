class Coffee_List {
  final String name;
  final String detals;

  Coffee_List(
    this.name,
    this.detals,
  );
}

List<Coffee_List> detals = [
  Coffee_List(
      "Espresso ....................... \$3.00 Single", "shot Espresso"),
  Coffee_List(
      "Doppio ......................... \$5.00 Double", "shot Espresso"),
  Coffee_List("Macchiato .................... \$4.50 Espresso",
      "with a dollop of milk"),
  Coffee_List("Cafe Latte ..................... \$4.50 Espresso",
      "with steamed milk and foam"),
  Coffee_List("Cappuccino ................... \$4.00 Short", "size latte"),
  Coffee_List("Affogato ....................... \$5.00 Espresso",
      "with vanilla ice-cream"),
];
