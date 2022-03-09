class Room {
    let number: Int
    let width : Double
    let height : Double
    var description : String {
        return "Num = \(number), Width = \(width), Height = \(height), Area = \(calculateArea())"
    }
    init(number: Int, width: Double, height: Double) {
        self.number = number
        self.width = width
        self.height = height
    }
    
    func calculateArea() -> Double {
        return width * height
    }
}

class StudyRoom : Room {
    let maxOccupancy : Int
    override var description: String {
        return super.description + " Max Cap = \(maxOccupancy)"
    }
    init(number: Int, width: Double, height: Double, maxOccupancy: Int) {
        self.maxOccupancy = maxOccupancy
        super.init(number: number, width: width, height: height)
    }
    func printDescription() {
        print(self.description)
    }
}

class Classroom : Room {
    let equipment : [String : Double]
    override var description: String {
        return super.description + " Total Equipment Cost = \(calculateCost())"
    }
    init(number: Int, width: Double, height: Double, equipment: [String : Double]) {
        self.equipment = equipment
        super.init(number: number, width: width, height: height)
    }
    func calculateCost() -> Double {
        var cost = 0.0
        for i in equipment {
            cost += i.value
        }
        return cost
    }
    func printDescription() {
        print(self.description)
    }
}

let exampleStudyRoom = StudyRoom(number: 1, width: 10, height: 100, maxOccupancy: 1000)
let exampleClassRoom = Classroom(number: 2, width: 20, height: 200, equipment: ["computer": 3500, "projector": 2000, "board": 1, "tables": 5, "chairs": 10])

exampleStudyRoom.printDescription()
exampleClassRoom.printDescription()
