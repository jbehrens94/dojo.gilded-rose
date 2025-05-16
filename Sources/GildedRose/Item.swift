public class Item {
    public struct State {
        var sellIn: Int
        var quality: Int
    }

    var name: String
    var state: State

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.state = Item.State(sellIn: sellIn, quality: quality)
    }

    public func decreaseQuality() {
        if state.quality > 0 {
            state.quality -= 1
        }
    }

    public func increaseQuality(by number: Int) {
        if state.quality < 50 {
            state.quality += number
        }
    }

    public func setQualityToMinimum() {
        state.quality = 0
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        name + ": sell in " + String(state.sellIn) + " days, quality: " + String(state.quality)
    }
}
