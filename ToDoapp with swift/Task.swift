import SwiftData

@Model
class Task {
    
    var name: String
    var isCompleted: Bool = false
    
    init( name: String ) {
     
        self.name = name
        
    }
}

