import XCTest
import Quick
import Nimble

@testable import GeneralFormatter

class CPFFormatterTests: QuickSpec {

    override func spec() {

        var formatter: CPFFormatter!

        beforeEach {
            formatter = CPFFormatter()
        }

        describe("CPFFormatter") {

            it("should formatt a complete cpf") {
                let given = formatter.format(value: "12345678900")
                let expected = "123.456.789-00"

                expect(given).to(equal(expected))
            }

            it("should'nt add any character") {
                let given = formatter.format(value: "123")
                let expected = "123"

                expect(given).to(equal(expected))
            }

            it("should add `.` when four digits is passed") {
                let given = formatter.format(value: "1234")
                let expected = "123.4"

                expect(given).to(equal(expected))
            }

            it("should'nt add the second `.` when six digits is passed") {
                let given = formatter.format(value: "123456")
                let expected = "123.456"

                expect(given).to(equal(expected))
            }

            it("should add the second `.` when seven digits is passed") {
                let given = formatter.format(value: "1234567")
                let expected = "123.456.7"

                expect(given).to(equal(expected))
            }

            it("should'nt add the third `-` when nine digits is passed") {
                let given = formatter.format(value: "123456789")
                let expected = "123.456.789"

                expect(given).to(equal(expected))
            }

            it("should add the third `-` when ten digits is passed") {
                let given = formatter.format(value: "1234567890")
                let expected = "123.456.789-0"

                expect(given).to(equal(expected))
            }
        }
    }
}
