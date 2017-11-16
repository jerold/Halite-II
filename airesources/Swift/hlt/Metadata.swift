import Foundation


public class Metadata {
    public let tokens: [String]
    var index: Int
    
    init(data: [String]) {
        self.tokens = data
        self.index = 0
    }
    
    public func pop() -> String {
        let token = tokens[index]
        index = index + 1
        return token
    }
    
    public func isEmpty() -> Bool {
        return index == tokens.count
    }
}
