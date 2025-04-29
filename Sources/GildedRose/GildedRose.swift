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

            if !isAgedBrie(item: item) && !isBackstagePasses(item: item) {
                if isQualityPositive(item: item) {
                    decreaseQuality(item: item)
                }
            } else {
                if isQualityBelowFifty(item: item) {
                    increaseQuality(item: item)

                    if isBackstagePasses(item: item) {
                        if items[i].sellIn < 11 {
                            if isQualityBelowFifty(item: item) {
                                increaseQuality(item: item)
                            }
                        }

                        if items[i].sellIn < 6 {
                            if isQualityBelowFifty(item: item) {
                                increaseQuality(item: item)
                            }
                        }
                    }
                }
            }

            decreaseSellIn(item: item)

            if items[i].sellIn < 0 {
                if !isAgedBrie(item: item) {
                    if !isBackstagePasses(item: item) {
                        if isQualityPositive(item: item) {
                            decreaseQuality(item: item)
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if isQualityBelowFifty(item: item) {
                        increaseQuality(item: item)
                    }
                }
            }
        }
    }

    private func isAgedBrie(item: Item) -> Bool {
        item.name == "Aged Brie"
    }

    private func isBackstagePasses(item: Item) -> Bool {
        item.name == "Backstage passes to a TAFKAL80ETC concert"
    }

    private func isSulfuras(item: Item) -> Bool {
        item.name == "Sulfuras, Hand of Ragnaros"
    }

    private func isQualityPositive(item: Item) -> Bool {
        item.quality > 0
    }

    private func isQualityBelowFifty(item: Item) -> Bool {
        item.quality < 50
    }

    private func decreaseQuality(item: Item) {
        item.quality = item.quality - 1
    }

    private func increaseQuality(item: Item) {
        item.quality = item.quality + 1
    }

    private func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }
    // swiftlint:enable identifier_name shorthand_operator cyclomatic_complexity
}
