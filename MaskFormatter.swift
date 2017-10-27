struct MaskFormatter {
    func mask(value: String, with mask: String) -> String {
        var result = ""
        let masks = getTuppleOf(mask: mask)
        value.characters.enumerated().forEach { (offset: Int, element: Character) in
            if let newCharacter = masks.filter({ $0.pos == offset }).first {
                result.append(newCharacter.value)
            }
            result.append(element)
        }
        return result
    }

    func getTuppleOf(mask: String) -> [(pos: Int, value: String)] {
        return mask.characters.enumerated().flatMap ({ (offset: Int, element: Character) in
            return element != "#" ? (offset, element.description) : nil
        }).enumerated().map ({ return ($1.0 - $0, $1.1) })
    }
}
