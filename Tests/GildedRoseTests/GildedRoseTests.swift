import Testing

@testable
import GildedRose

@Suite("GildedRose")
struct GildedRoseTests {
    @Test
    func test_dexterityVest_whenSellInIsPositive_shouldDecreaseQualityByOne() {
        let items = [Item(name: "Dexterity Vest", sellIn: 10, quality: 20)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == 9)
        #expect(items[0].state.quality == 19)
    }

    @Test
    func test_dexterityVest_whenSellInZeroDays_shouldDecreaseQualityByTwo() {
        let items = [Item(name: "Dexterity Vest", sellIn: 0, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == -1)
        #expect(items[0].state.quality == 8)
    }

    @Test
    func test_agedBrie_whenSellInIsPositive_shouldIncreaseQualityByOne() {
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == 1)
        #expect(items[0].state.quality == 1)
    }

    @Test
    func test_agedBrie_whenSellInDecreasesTwoTimes_shouldIncreaseQualityByTwo() {
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        app.updateQuality()

        #expect(items[0].state.sellIn == 0)
        #expect(items[0].state.quality == 2)
    }

    @Test
    func test_agedBrie_whenQualityIsFifty_andADayPasses_itIsNeverAboveQualityOfFifty() {
        let items = [Item(name: "Aged Brie", sellIn: 1, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.quality == 50)
    }

    @Test
    func test_elixirOfMongoose_whenSellInIsPositive_shouldDecreaseQualityByOne() {
        let items = [Item(name: "Elixir of Mongoose", sellIn: 5, quality: 7)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == 4)
        #expect(items[0].state.quality == 6)
    }

    @Test
    func test_elixirOfMongoose_whenSellInIsZero_shouldDecreaseQualityByTwo() {
        let items = [Item(name: "Elixir of Mongoose", sellIn: 0, quality: 7)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == -1)
        #expect(items[0].state.quality == 5)
    }

    @Test
    func test_sulfuras_whenCycleHappens_shouldNotDecreaseOrIncrease() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == 0)
        #expect(items[0].state.quality == 80)
    }

    @Test
    func test_sulfuras_whenCycleHappensWithNegativeSellIn_shouldNotDecreaseOrIncrease() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == -1)
        #expect(items[0].state.quality == 80)
    }

    @Test
    func test_backstagePasses_whenSellInIsMoreThanTen_qualityShouldIncreaseByOne() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 20, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == 19)
        #expect(items[0].state.quality == 11)
    }

    @Test
    func test_backstagePasses_whenSellInIsLessThanTen_shouldIncreaseQualityByOne() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == 9)
        #expect(items[0].state.quality == 12)
    }

    @Test
    func test_backstagePasses_whenSellInIsLessThanFive_shouldIncreaseQualityByOne() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == 4)
        #expect(items[0].state.quality == 13)
    }

    @Test
    func test_backstagePasses_whenSellInIsZero_shouldSetQualityToZero() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()

        #expect(items[0].state.sellIn == -1)
        #expect(items[0].state.quality == 0)
    }
}
