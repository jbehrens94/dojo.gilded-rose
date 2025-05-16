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
                item.increaseQuality(by: 1)

                if isBackstagePasses(item: item) {
                    if isSellInTenAtMost(item: item) {
                        item.increaseQuality(by: 1)
                    }

                    if isSellInFiveAtMost(item: item) {
                        item.increaseQuality(by: 1)
                    }
                }
            }

            decreaseSellIn(item: item)

            if isSellInNegative(item: item) {
                if !isAgedBrie(item: item) {
                    if !isBackstagePasses(item: item) {
                        item.decreaseQuality()
                    } else {
                        item.setQualityToMinimum()
                    }
                } else {
                    item.increaseQuality(by: 1)
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
        item.state.sellIn < 0
    }

    private func isSellInFiveAtMost(item: Item) -> Bool {
        item.state.sellIn < 6
    }

    private func isSellInTenAtMost(item: Item) -> Bool {
        item.state.sellIn < 11
    }

    private func decreaseSellIn(item: Item) {
        item.state.sellIn -= 1
    }
}
