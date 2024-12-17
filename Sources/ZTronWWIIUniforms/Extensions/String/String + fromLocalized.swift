import Foundation

public extension String {
    func fromLocalized() -> String {
        return String(
            localized: String.LocalizationValue(self),
            bundle: .module,
            locale: Locale(
                identifier: Bundle.main.preferredLocalizations.first ?? "en-US"
            )
        )
    }
}
