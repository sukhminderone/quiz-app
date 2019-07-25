
import Foundation

class Quiz{
    
    let question: String
    let choiceA: String
    let choiceB: String
    let choiceC: String
    let choiceD: String
    let rightAnswer: Int
    
    init( question: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, answer: Int){
        
        self.question = question
        self.choiceA = choiceA
        self.choiceB = choiceB
        self.choiceC = choiceC
        self.choiceD = choiceD
        rightAnswer = answer
    }
}
