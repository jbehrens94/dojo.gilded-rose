public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    // swiftlint:disable identifier_name shorthand_operator cyclomatic_complexity
    public func updateQuality() {
        for i in 0 ..< items.count {
            let item = items[i]

            guard !isSulfuras(item: item) else { return }

            if items[i].name != "Aged Brie" && items[i].name != "Backstage passes to a TAFKAL80ETC concert" {
                if items[i].quality > 0 {
                    if items[i].name != "Sulfuras, Hand of Ragnaros" {
                        items[i].quality = items[i].quality - 1
                    }
                }
            } else {
                if items[i].quality < 50 {
                    items[i].quality = items[i].quality + 1

                    if items[i].name == "Backstage passes to a TAFKAL80ETC concert" {
                        if items[i].sellIn < 11 {
                            if items[i].quality < 50 {
                                items[i].quality = items[i].quality + 1
                            }
                        }

                        if items[i].sellIn < 6 {
                            if items[i].quality < 50 {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                    }
                }
            }

            decreaseSellIn(item: item)

            if items[i].sellIn < 0 {
                if items[i].name != "Aged Brie" {
                    if items[i].name != "Backstage passes to a TAFKAL80ETC concert" {
                        if items[i].quality > 0 {
                            if items[i].name != "Sulfuras, Hand of Ragnaros" {
                                items[i].quality = items[i].quality - 1
                            }
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if items[i].quality < 50 {
                        items[i].quality = items[i].quality + 1
                    }
                }
            }
        }
    }

    fileprivate func isSulfuras(item: Item) -> Bool {
        item.name == "Sulfuras, Hand of Ragnaros"
    }

    private func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }
    // swiftlint:enable identifier_name shorthand_operator cyclomatic_complexity
}
