import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
    } // 여기서 반환된 Formula가 testcase에서 sut에 넣으면 될듯? 암아두
    
    private func componentsByOperators(from input: String) -> [String] {
        var resultArray: [String] = [input]
        for operation in Operator.allCases {
            if input.contains(operation.rawValue) {
                resultArray = input.split(with: operation.rawValue)
            }
        }
        return resultArray
    }
}
