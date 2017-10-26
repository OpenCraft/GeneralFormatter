import XCTest
@testable import GeneralFormatter

class CPFFormatterTests: XCTestCase {

    var formatter: CPFFormatter!

    override func setUp() {
        super.setUp()
        formatter = CPFFormatter()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testFormatCompletedCPF() {
        let given = formatter.format(value: "12345678900")
        let expected = "123.456.789-00"

        assert(given == expected)
    }
}
