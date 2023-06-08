import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
   
    @IBOutlet weak var progress: UIProgressView!
    
    private let imageArray: [UIImage] = [
        UIImage(named:"Underweight.jpg")!,
        UIImage(named:"Healthy weight.jpg")!,
        UIImage(named:"Overweight.jpg")!,
        UIImage(named:"Obese.jpg")!
    ]
    
    @IBAction func calculateButtonTapped(_ sender: UIButton!) {
        
        var weight: Double = 0
        if let weightText = weightTextField.text {
            let stringWithPeriod = weightText.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
            
            if let weightDouble = Double(stringWithPeriod) {
                weight = weightDouble
            }
        }
        
        
        var height: Double = 0
        if let heightText = heightTextField.text {
            let stringWithPeriod = heightText.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
            
            if let heightDouble = Double(stringWithPeriod) {
                height = heightDouble
            }
        }
        
        
        let bmi = weight / (height * height)
        
        var classification: String
        let classificationImage = UIImageView()
        var classificationColor = UIColor()
        
        if bmi < 18.5 {
            classification = "Underweight"
            classificationImage.image = imageArray[0]
            classificationColor = .blue
        } else if bmi < 24.9 {
            classification = "Healthy weight"
            classificationImage.image = imageArray[1]
            classificationColor = .green
        } else if bmi < 29.9 {
            classification = "Overweight"
            classificationImage.image = imageArray[2]
            classificationColor = .orange
        } else {
            classification = "Obese"
            classificationImage.image = imageArray[3]
            classificationColor = .red
        }
        
        if weight == 0 && height == 0 {
            bmiLabel.text = "Enter weight and height"
        } else if height == 0 {
            bmiLabel.text = "Enter actual height"
        } else if weight == 0 {
            bmiLabel.text = "Enter actual weight"
        } else {
            bmiLabel.text = "BMI: \(String(format: "%.1f", bmi)), \(classification)"
            image.image = classificationImage.image!
            
            progress.isHidden = false
            progress.progress = (Float(bmi) * (100 / 29.9)) / 100
            progress.tintColor = classificationColor
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.isHidden = true
    }
    
}
