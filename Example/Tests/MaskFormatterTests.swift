import XCTest
import Quick
import Nimble
@testable import GeneralFormatter

class MaskFormatterTests: QuickSpec {
    override func spec() {
        describe("MaskFormatter") {

            it("should completly mask string") {
                let formatter = MaskFormatter()
                let given = formatter.mask(value: "123456", with: "###.###.")

                expect(given).to(equal("123.456"))
            }

            it("should'nt mask value") {
                let formatter = MaskFormatter()
                let given = formatter.mask(value: "123", with: "###.###")

                expect(given).to(equal("123"))
            }

            it("should add mask only for the occurencies") {
                let formatter = MaskFormatter()
                let given = formatter.mask(value: "1234", with: "###.###.")

                expect(given).to(equal("123.4"))
            }

            it("should add mask when mask is lower than value") {
                let formatter = MaskFormatter()
                let given = formatter.mask(value: "1234", with: "#.")

                expect(given).to(equal("1.234"))
            }

            it("shouldnt maask") {
                let formatter = MaskFormatter()
                let given = formatter.mask(value: "1234", with: "#")

                expect(given).to(equal("1234"))
            }
        }
    }
}
