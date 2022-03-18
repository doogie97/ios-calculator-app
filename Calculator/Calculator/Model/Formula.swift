import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operations = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return 0 }

        while !operands.isEmpty {
            let rhs = operands.dequeue()
            let pickedOperator = operations.dequeue()
            
            for coperator in Operator.allCases {
                if pickedOperator == coperator {
                    result = coperator.calcuate(lhs: result, rhs: rhs ?? 0)
                }
            }
        }
        return result
    }
}
