public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        items.forEach { item in
            guard !isSulfuras(item: item) else { return }

            if !isAgedBrie(item: item) && !isBackstagePasses(item: item) {
                item.decreaseQuality()
            } else {
                item.increaseQuality()

                if isBackstagePasses(item: item) {
                    if isSellInTenAtMost(item: item) {
                        item.increaseQuality()
                    }

                    if isSellInFiveAtMost(item: item) {
                        item.increaseQuality()
                    }
                }
            }

            decreaseSellIn(item: item)

            if isSellInNegative(item: item) {
                if !isAgedBrie(item: item) {
                    if !isBackstagePasses(item: item) {
                        item.decreaseQuality()
                    } else {
                        setQualityToZero(item: item)
                    }
                } else {
                    item.increaseQuality()
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
        item.quality -= item.quality
    }

    private func decreaseSellIn(item: Item) {
        item.sellIn -= 1
    }
}
