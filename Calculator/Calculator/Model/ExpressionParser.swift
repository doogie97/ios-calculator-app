import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let numberAndOperation = componentsByOperators(from: input)
        var number = CalculatorItemQueue<Double>()
        var operation = CalculatorItemQueue<Operator>()
        
        for element in numberAndOperation {
            if let elementToDouble = Double(element) {
                number.enqueue(elementToDouble)
            } else {
                Operator.allCases.forEach({ op in
                    if String(op.rawValue) == element {
                        operation.enqueue(op)
                    }
                })
            }
        }
        return Formula(operands: number, operations: operation)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var resultArray: [String] = [input]
        for operation in Operator.allCases {
            if input.contains(operation.rawValue) {
                resultArray = input.split(with: operation.rawValue)
            }
        }
        return resultArray
    }
}
