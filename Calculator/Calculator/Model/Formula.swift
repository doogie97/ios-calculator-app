import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operations = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return 0 }

        while !operands.isEmpty {
            let rhs = operands.dequeue()
            let pickedOperation = operations.dequeue()
            
            for operation in Operator.allCases {
                if pickedOperation == operation {
                    result = operation.calcuate(lhs: result, rhs: rhs ?? 0)
                }
            }
        }
        return result
    }
}
