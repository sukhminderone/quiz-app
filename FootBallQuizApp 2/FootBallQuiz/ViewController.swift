
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionCounter: UILabel!

  
    
    @IBOutlet weak var questionLabel: UILabel!
    
    //Buttons for options
    
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var fourthChoice: UIButton!
    // creating array of objects of class Quiz to store all questions
    var hardcodeQuestions = [Quiz]()
    var questionNumber: Int = 0
    var score: Int = 0
    var userResponse: Int = 0
    // array to store random 5 questions from list of questions
    var questionArray = [Quiz]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // method to randomly select 5 questions
        randomizeQuestions()
        //method to move to next question
        updateQuestion()
        // method to update question number
        updateQuestionNumber()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // this method is invoked when any of the button representing 4 options is pressed
    @IBAction func choiceSelected(_ sender: UIButton) {
        //if button tag is same as of correct answer
        if sender.tag == userResponse {
           
            score += 1  //increment score
            
        }else{
        
            
            
        }
        
        questionNumber += 1 //increment question number after pressing any choice button
        updateQuestion()
        
    }
    
    func updateQuestion(){
        // checking if question number is less than or equal to last question number
        if questionNumber <= questionArray.count - 1{
            
            questionLabel.text = questionArray[questionNumber].question
            firstChoice.setTitle(questionArray[questionNumber].choiceA, for: UIControlState.normal)
            secondChoice.setTitle(questionArray[questionNumber].choiceB, for: UIControlState.normal)
            thirdChoice.setTitle(questionArray[questionNumber].choiceC, for: UIControlState.normal)
            fourthChoice.setTitle(questionArray[questionNumber].choiceD, for: UIControlState.normal)
            userResponse = questionArray[questionNumber].rightAnswer
            updateQuestionNumber()
            
            
        }
            // if all 5 questions are answered
        else {
            // for score less than or equal to 2
            if(score<=2){
                // alert to restart question
                let alert = UIAlertController(title: "please try again", message: " your score is \(score)/5", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Restart quiz", style: .default, handler: {action in self.startQuizAgain()})
                
                alert.addAction(restartAction)
                
                present(alert, animated: true, completion: nil)
            }
                // for score = 3
            else if (score == 3)
            {
                //alert to restart quiz or go back to main screen
                let alert = UIAlertController(title: "Good Job", message: " your score is \(score)/5", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Start Again", style: .default, handler:{action in self.startQuizAgain()})
                let mainscreenAction = UIAlertAction(title: "Go back to Home screen", style: .default, handler:{_ in
                    self.performSegue(withIdentifier: "goBack", sender: nil)})
                alert.addAction(restartAction)
                alert.addAction(mainscreenAction)
                present(alert, animated: true, completion: nil)
                
                
            }
                // for score = 4
            else if (score == 4)
            {
                //alert to restart quiz or go back to main screen
                let alert = UIAlertController(title: "Excellent Work", message: "your score is \(score)/5", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Start Again", style: .default, handler: {action in self.startQuizAgain()})
                let mainscreenAction = UIAlertAction(title: "Go back to Home screen", style: .default, handler:{_ in
                    self.performSegue(withIdentifier: "goBack", sender: nil)})
                alert.addAction(restartAction)
                alert.addAction(mainscreenAction)
                present(alert, animated: true, completion: nil)
                
                
            }
                // for score = 5
            else if (score == 5)
            {
                //alert to restart quiz or go back to main screen
                let alert = UIAlertController(title: "You are a Genious", message: "your score is \(score)/5", preferredStyle: .alert)
                // if user choose to restart quiz from alert
                let restartAction = UIAlertAction(title: "Start Again", style: .default, handler: {action in self.startQuizAgain()})
                //if user choose to go back to main screen
                let mainscreenAction = UIAlertAction(title: "Go back to Home screen", style: .default, handler:{_ in
                    self.performSegue(withIdentifier: "goBack", sender: nil)})
                alert.addAction(restartAction)
                alert.addAction(mainscreenAction)
                present(alert, animated: true, completion: nil)
                
                
            }
        }
        
        
    }
    
    func updateQuestionNumber(){
      
        //updating question number
        questionCounter.text = "\(questionNumber + 1)/\(questionArray.count)"

        
    }
    
    func startQuizAgain(){
        //resetting score and question number
        score = 0
        questionNumber = 0
        // method to randomly select 5 questions
        randomizeQuestions()
        updateQuestion()
        
    }
    
    //method to reset array
    func resetAraay(){
       hardcodeQuestions.removeAll()
        // adding questions in list array of objects
         hardcodeQuestions.append(Quiz(question: "Question: which football team won maximum world cups?", choiceA: "brazil", choiceB: "england", choiceC: "italy", choiceD: "germany", answer: 1))
        
         hardcodeQuestions.append(Quiz(question: "Question: which football player scored highest number of goals?", choiceA: " Ali Daei", choiceB: "lionel Messi", choiceC: " Ferenc Puskas", choiceD: "Kunishige Kamamoto", answer: 1))
        
        hardcodeQuestions.append(Quiz( question: "Question: How many teams have won the World Cup since its inception in 1930?", choiceA: "9", choiceB: "6", choiceC: "4", choiceD: "8", answer: 4))
        
       hardcodeQuestions.append(Quiz(question: "Question: Who has the record for scoring the most goals in World Cup history?", choiceA: "ronaldo", choiceB: "Miroslav Klose", choiceC: "lionel messi", choiceD: "Hussein Saeed", answer: 2))
        
       hardcodeQuestions.append(Quiz(question: "Question: how many players are on each side of football game?", choiceA: "12", choiceB: "9", choiceC: "10", choiceD: "11", answer: 4))
        
       hardcodeQuestions.append(Quiz( question: "Question: when did the first football world cup held?", choiceA: "1935", choiceB: "1930", choiceC: "1928", choiceD: "1931", answer: 2))
        
        hardcodeQuestions.append(Quiz(question: "Question: which is the first football team to won olympic gold?", choiceA: " usa", choiceB: "canada", choiceC: "great britain", choiceD: "france", answer: 3))
        
        hardcodeQuestions.append(Quiz(question: "Question: In which country are the headquarters of FIFA located?", choiceA: "france", choiceB: "germany", choiceC: "brazil", choiceD: "switzerland", answer: 4))
        
        hardcodeQuestions.append(Quiz( question: "Question: Which trophy was awarded to the winners of World Cup tournament until 1970?", choiceA: "jules rimet trophy", choiceB: "grondonacup", choiceC: "heisman trophy", choiceD: "arsenal trophy", answer: 1))
        
         hardcodeQuestions.append(Quiz( question: "Question: which is largest football stadium?", choiceA: "Camp Nou", choiceB: "Rungrado May Stadium", choiceC: "FNB Soccer City Stadium", choiceD: "Rose Bowl Stadium", answer: 2))
        
    }
    func randomizeQuestions(){
        questionArray.removeAll()
        resetAraay()
        for _ in 1...5 {
            //method to randomly select one index
            let randomIndex = Int(arc4random_uniform(UInt32( hardcodeQuestions.count)))
            
            //selecting question from that random index and adding to question Array
            questionArray.append( hardcodeQuestions[randomIndex])
            //removing the question from main array in order to avoid repetition of question
           hardcodeQuestions.remove(at: randomIndex)
        }
        
    }
    //method to perform segue to move to home screen after quiz is completed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBack" {
            _ = segue.destination as! MainViewController
        }
    }
    
    
    
}





