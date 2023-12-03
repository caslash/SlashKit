//
//  StateMachine.swift
//  
//
//  Created by Cameron Slash on 12/2/23.
//

import Foundation

open class State<T: CustomStringConvertible>: CustomStringConvertible {
    open var description: String
    
    open var name: String
    
    open var nextStateString: String?
    
    open var data: Any?
    
    open var type: T
    
    public init(type: T) {
        self.name = type.description
        self.type = type
        self.description = self.name
    }
    
    open func getName() -> String { return name }
    
    open func getType() -> T { return type }
    
    open func executeAction(action: Int, data: [Any]) -> Bool { return false }
    
    open func initState(data: Any) { fatalError("initState(data:) has not been implemented") }
    
    open func updateState(timeElapsed: Float) { fatalError("updateState(timeElapsed:) has not been implemented") }
    
    open func cleanupState() { fatalError("cleanupState() has not been implemented") }
    
    open func nextState() -> String? { return self.nextStateString }
    
    open func canAdvance(nextState: String) -> Bool { return true }
    
    open func setNextState(state: String) { self.nextStateString = state }
    
    open func getData() -> Any? { return self.data }
}
