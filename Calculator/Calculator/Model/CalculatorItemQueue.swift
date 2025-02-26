import Foundation

struct CalculatorItemQueue<item: CalculateItem> {
    private var enqueueList: [item] = []
    private var dequeueList: [item] = []
    var count: Int { enqueueList.count + dequeueList.count }
    var first: item? { dequeueList.isEmpty ? enqueueList.first : dequeueList.last }
    var last: item? { enqueueList.isEmpty ? dequeueList.first : enqueueList.last }
    var isEmpty: Bool { enqueueList.isEmpty && dequeueList.isEmpty }
    
    mutating func enqueue(_ item: item) {
        enqueueList.append(item)
    }
    
    mutating func dequeue() -> item? {
        if dequeueList.isEmpty {
            dequeueList = enqueueList.reversed()
            enqueueList.removeAll()
        }
        return dequeueList.popLast()
    }
    
    mutating func removeAll() {
        enqueueList.removeAll()
        dequeueList.removeAll()
    }
}
