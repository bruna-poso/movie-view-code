import UIKit

public class MovieStrings {
    private static let tableName = "Localizable"

    static func localized(for key: String) -> String {
        let bundle = Bundle(for: MovieStrings.self)
        return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: "", comment: "")
    }
}

extension MovieStrings {
    static let `popularList` = localized(for: "Lista de Filmes Populares")
}
