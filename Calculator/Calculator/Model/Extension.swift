import Foundation

extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        var result = self.split(separator: target).compactMap({String($0)})
        if self.contains(target) {
            result.append(String(target))
        }
        return result
    }
}
