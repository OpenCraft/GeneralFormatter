import Foundation

struct CPFFormatter: CustomFormatter {

    private let mask = "###.###.###-##"
    private let maskFormatter = MaskFormatter()

    func format(value: String) -> String {
        return maskFormatter.mask(value: value, with: mask)
    }

    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 14)
    }
}
