//: Playground - noun: a place where people can play

import UIKit
import Foundation


//instruction
//1.input data by typing "func testInput(first:Int, second: Int, condition: String)"
//1.1 initialize N K by declare condition = "assignNK"
//1.2 initialize A_N B_N by type first = numbers in range of 1-8, second = numbers in range of 1-8 declare condition = "continue"
//1.3 finish operation by type first = 0, second = 0 and declare condition = "end"
//2.get result by declare variable = showResult()

//test function
    //create array to store exchange index
    var testArrayConvert = [Array<Int>]()
    //declare main array
    var testArray = [1,2,3,4,5,6,7,8]

    //initailize number of operations
    var i = 0
    //initailize number of set
    var j = 0

    //1. input function
    func testInput(first:Int, second: Int, condition: String)
    {
        
        if  condition == "assignNK"
        {
            if first > 0 && first < 50 && second > 0
            {
                i = first
                j = second
            }
            else
            {
                print("re-type")
            }
            
        }
        else if condition == "continue"
        {
            if first > 0 && first < 9 && second > 0 && second < 9
            {
                testArrayConvert.append([first,second])
            }
            else
            {
                print("re-type")
            }
        }
        else if condition == "end" && first == 0 && second == 0
        {
            result(A: testArrayConvert, N: i, K: j)
        }
        
    }

    //2. main operation
    //2.1 check if number of operation is a power of number of sets or number of sets is a power of ten
    func checkPower(A:Int, B:Int) -> Bool
    {
        let C = Float(A)
        let D = Float(B)
        let E = Float(log(C) / log(D))
        let F = E.rounded(.down)
        if E == F
        {
            return true
        }
        return false
    }


    //2.2 prevent repeatedly loop
    func result(A: [Array<Int>], N: Int, K:Int)
    {
        //2.2.1 if number of sets is a power of ten, there will give the same result
        if checkPower(A: K, B: 10)
        {
            convert(A: A, N: N, K: 10)
        }
        else
        {
            //2.2.2 if number of operation is a power of number of sets, there will give the same result
            if checkPower(A: K, B: N) && K >= N
            {
                convert(A: A, N: N, K: N)
            }
            else
            {
                convert(A: A, N: N, K: K)
            }
        }
    }


    //2.3 convert an array
    func convert(A: [Array<Int>], N: Int, K:Int)
    {
        for _ in 0..<K
        {
            for y in 0..<N
            {
                swap(&testArray[Int(A[y][0]) - 1], &testArray[Int(A[y][1]) - 1])
            }
        }
    }


    //3. show result
    func showResult() -> String
    {
        let stringArray = testArray.map
        {
            String($0)
        }
        return stringArray.joined(separator: " ")
    }
    
//example

testInput(first: 16, second: 1000000000, condition: "assignNK")
testInput(first: 1, second: 3, condition: "continue")
testInput(first: 6, second: 8, condition: "continue")
testInput(first: 3, second: 5, condition: "continue")
testInput(first: 2, second: 6, condition: "continue")
testInput(first: 3, second: 7, condition: "continue")
testInput(first: 3, second: 4, condition: "continue")
testInput(first: 4, second: 7, condition: "continue")
testInput(first: 2, second: 4, condition: "continue")
testInput(first: 1, second: 3, condition: "continue")
testInput(first: 2, second: 7, condition: "continue")
testInput(first: 2, second: 7, condition: "continue")
testInput(first: 2, second: 4, condition: "continue")
testInput(first: 6, second: 7, condition: "continue")
testInput(first: 1, second: 7, condition: "continue")
testInput(first: 3, second: 4, condition: "continue")
testInput(first: 1, second: 6, condition: "continue")
testInput(first: 0, second: 0, condition: "end")
let result = showResult()
print(result)
