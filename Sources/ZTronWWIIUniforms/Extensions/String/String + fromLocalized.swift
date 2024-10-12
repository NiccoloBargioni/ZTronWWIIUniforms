import Foundation

public extension String {
    func fromLocalized() -> String {
        return String(localized: String.LocalizationValue(self))
    }
}
