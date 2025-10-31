class Root {
    var rootProperty: String = "rootValue"
    func rootMethod() {
        print("root Method Called")
    }
    
    init(rootProperty: String) {
        self.rootProperty = rootProperty
    }
}

class Leaf1: Root {
    func leafMethod() { // Leaf1에만 있는 새로운 메소드
        print("Leaf1 Method Called")
    }
}

class Leaf2: Root {
    
}

class Leaf3: Root {
    
}

// Root 타입 변수에 Leaf1 인스턴스를 할당 (이것 자체가 다형성입니다)
var instance: Root = Leaf1(rootProperty: "Leaf1")


class View {
    lazy var name: String = "Rudy"
}

var op1: String?
var op2: String?
var op3: String?
var op4: String?

if op1?.isEmpty == false,
    op2?.isEmpty == true &&
    true,
    op3?.isEmpty == true ||
    op4?.isEmpty == false {

}
