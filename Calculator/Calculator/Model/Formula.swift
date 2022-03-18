import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operations = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard !operands.isEmpty || !operations.isEmpty else { return 0}
        var lhs: Double?
        var rhs: Double?
        var result: Double?
        var op: Operator?
        while !operands.isEmpty {
            if lhs == nil {
                lhs = operands.dequeue()
            }
            rhs = operands.dequeue()
            op = operations.dequeue()
            
            for i in Operator.allCases {
                
                if op == i {
                   result = i.calcuate(lhs: lhs!, rhs: rhs!)
                    lhs = result
                    rhs = nil
                }
            }
        }
        return result!
    }
}
