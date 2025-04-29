public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }

    public func decreaseQuality() {
        if quality > 0 {
            quality -= 1
        }
    }

    public func increaseQuality() {
        if quality < 50 {
            quality += 1
        }
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        name + ": sell in " + String(sellIn) + " days, quality: " + String(quality)
    }
}
