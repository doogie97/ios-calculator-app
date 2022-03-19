//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 최최성균 on 2022/03/18.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    //MARK: - result()
    func test_result호출시_2와3과5_plus와multiply가있을때_25를반환하는지() {
        //given
        sut.operands.enqueue(2)
        sut.operands.enqueue(3)
        sut.operands.enqueue(5)
        sut.operations.enqueue(.add)
        sut.operations.enqueue(.multiply)
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, 25)
    }
    
    func test_result호출시_큐가비어있을경우_0을반환하는지() {
        sut.operands.removeAll()
        sut.operations.removeAll()
        XCTAssertEqual(sut.result(), 0)
    }
    
    func test_result호출시_operands큐가한개고연산자가하나일경우_해당수를반환하는지() {
        //given
        let input: Double = 4
        //when
        sut.operands.enqueue(input)
        sut.operations.enqueue(.add)
        //then
        XCTAssertEqual(sut.result(), input)
    }
    
    func test_result호출시_operations큐만비어있을경우_해당수를반환하는지() {
        //given
        let input: Double = 1235
        //when
        sut.operands.enqueue(input)
        sut.operations.removeAll()
        //then
        XCTAssertEqual(sut.result(), input)
    }
    
    //MARK: - ExpressionParser.parse 호출시
    func test_parse호출후result호출시_125빼기5곱하기음수4나누기음수5이_96을반환하는지() {
        var result = ExpressionParser.parse(from: "125")
        sut.operands.enqueue(result.operands.dequeue()!)
        result = ExpressionParser.parse(from: "-5")
        sut.operands.enqueue(result.operands.dequeue()!)
        sut.operations.enqueue(result.operations.dequeue()!)
        result = ExpressionParser.parse(from: "×-4")
        sut.operands.enqueue(result.operands.dequeue()!)
        sut.operations.enqueue(result.operations.dequeue()!)
        result = ExpressionParser.parse(from: "÷-5")
        sut.operands.enqueue(result.operands.dequeue()!)
        sut.operations.enqueue(result.operations.dequeue()!)
        
        XCTAssertEqual(sut.result(), 96)
    }
}
