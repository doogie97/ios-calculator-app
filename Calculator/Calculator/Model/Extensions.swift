import Foundation

extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        let splitString = self.split(separator: target).map({String($0)})
        return splitString
    }
}
