import Cocoa

func load(file named: String) -> String? {
    guard let fileUrl = Bundle.main.url(forResource: named, withExtension: "txt") else {
        return nil
    }
    
    guard let content = try? String(contentsOf: fileUrl, encoding: .utf8) else {
        return nil
    }
    
    return content
}

var data = ""
var calories:[String] = []

data = (load(file: "input1")!)
data.enumerateLines { line, _ in
    calories.append(line)
}

var totalCalories:[Int] = []
var countCalories: Int = 0

for i in 0 ..< calories.count {
    if calories[i] != "" {
        countCalories += Int(calories[i])!
    } else {
        totalCalories.append(countCalories)
        countCalories = 0
    }
}
var topThreeCalories:[Int] = []

print(totalCalories)
// print(totalCalories.max()!)
totalCalories.sort()

print(totalCalories.suffix(1))

topThreeCalories = totalCalories.suffix(3)

print(topThreeCalories.reduce(0,+))
