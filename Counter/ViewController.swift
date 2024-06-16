//
//  ViewController.swift
//  Counter
//
//  Created by Илья Кузнецов on 15.06.2024.
//

import UIKit

final class ViewController: UIViewController {
// Переменные со значением счетчика и настройкой даты
    private var count = 0
    private var date = ""
    private let dateFormatter = DateFormatter()
    
    @IBOutlet weak var counterLabel: UILabel!

// Поле с историей изменений
    @IBOutlet weak var historyCount: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyCount.text = "История изменений:"
        counterLabel.text = "0"
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
    }
    
    // Увелечение счетчика
        @IBAction func encreaseButton(_ sender: Any) {
            count += 1
            counterLabel.text = "Значение счетчика: \(count)"
            date = dateFormatter.string(from: Date())
            historyCount.text += "\n\(date): значение изменено на +1"
        }

    // Увменьшение счетчика
        @IBAction func decreaseButton(_ sender: Any) {
            date = dateFormatter.string(from: Date())
            if count == 0 {
                historyCount.text += "\n\(date): попытка уменьшить значение счётчика ниже 0"
            } else {
                count -= 1
                counterLabel.text = "Значение счетчика: \(count)"
                historyCount.text += "\n\(date): значение изменено на -1"
            }
        }
    // Сброс счетчика
        @IBAction func resetButton(_ sender: Any) {
            count = 0
            counterLabel.text = "Значение счетчика: \(count)"
            date = dateFormatter.string(from: Date())
            historyCount.text += "\n\(date): значение сброшено"
        }

}

