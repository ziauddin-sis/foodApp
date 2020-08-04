class Deal{

  String deal, category, item, any;
  int id, price, qty;

  Deal({ this.deal, this.category, this.item, this.any, this.id, this.price, this.qty });

  @override
  String toString() {
    return 'Deal{deal: $deal, category: $category, item: $item, any: $any, id: $id, price: $price, qty: $qty}';
  }
}