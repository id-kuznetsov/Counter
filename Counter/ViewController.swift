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
    private let dateFormatter = DateFormatter()
    
    @IBOutlet private weak var counterLabel: UILabel!

// Поле с историей изменений
    @IBOutlet private weak var historyCount: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyCount.text = "История изменений:"
        counterLabel.text = "0"
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
    }
    // Увеличение счетчика
        @IBAction private func encreaseButton(_ sender: Any) {
            count += 1
            counterLabel.text = "Значение счетчика: \(count)"
            historyCount.text += "\n\(setDate()): значение изменено на +1"
        }
    // Уменьшение счетчика
        @IBAction private func decreaseButton(_ sender: Any) {
            if count == 0 {
                historyCount.text += "\n\(setDate()): попытка уменьшить значение счётчика ниже 0"
            } else {
                count -= 1
                counterLabel.text = "Значение счетчика: \(count)"
                historyCount.text += "\n\(setDate()): значение изменено на -1"
            }
        }
    // Сброс счетчика
        @IBAction private func resetButton(_ sender: Any) {
            count = 0
            counterLabel.text = "Значение счетчика: \(count)"
            historyCount.text += "\n\(setDate()): значение сброшено"
        }
    // функция для расчета даты в момент нажатия кнопки
    private func setDate() -> String {
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }

}

