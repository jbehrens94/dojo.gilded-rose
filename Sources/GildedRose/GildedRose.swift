public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    // swiftlint:disable shorthand_operator cyclomatic_complexity
    public func updateQuality() {
        items.forEach { item in
            guard !isSulfuras(item: item) else { return }

            if !isAgedBrie(item: item) && !isBackstagePasses(item: item) {
                if isQualityPositive(item: item) {
                    decreaseQuality(item: item)
                }
            } else {
                if isQualityBelowFifty(item: item) {
                    increaseQuality(item: item)

                    if isBackstagePasses(item: item) {
                        if isSellInTenAtMost(item: item) {
                            if isQualityBelowFifty(item: item) {
                                increaseQuality(item: item)
                            }
                        }

                        if isSellInFiveAtMost(item: item) {
                            if isQualityBelowFifty(item: item) {
                                increaseQuality(item: item)
                            }
                        }
                    }
                }
            }

            decreaseSellIn(item: item)

            if isSellInNegative(item: item) {
                if !isAgedBrie(item: item) {
                    if !isBackstagePasses(item: item) {
                        if isQualityPositive(item: item) {
                            decreaseQuality(item: item)
                        }
                    } else {
                        setQualityToZero(item: item)
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

    private func isSellInNegative(item: Item) -> Bool {
        item.sellIn < 0
    }

    private func isSellInFiveAtMost(item: Item) -> Bool {
        item.sellIn < 6
    }

    private func isSellInTenAtMost(item: Item) -> Bool {
        item.sellIn < 11
    }

    private func setQualityToZero(item: Item) {
        item.quality = item.quality - item.quality
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
    // swiftlint:enable shorthand_operator cyclomatic_complexity
}
