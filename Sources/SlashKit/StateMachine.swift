//
//  StateMachine.swift
//
//
//  Created by Cameron Slash on 12/2/23.
//

import Foundation

open class StateMachine<U: CustomStringConvertible, T: MachineState<U>> {
    internal final var name: String
    
    open var currentState: T?
    
    open var states: [String: T] = [String: T]()
    
    public init(name: String) {
        self.name = name
    }
    
    open func getName() -> String{ return self.name }
    
    open func initialize() { }
    
    open func validateStateTransition(currentState: T?, nextState: String) -> Bool { return true }
    
    open func addState(name: String, state: T) { states.updateValue(state, forKey: name) }
    
    open func getCurrentStateName() -> String {
        if let currentState { return currentState.description }
        return "nil"
    }
    
    open func getCurrentState() -> T? { return currentState }
    
    open func removeState(name: String) { states.removeValue(forKey: name) }
    
    open func changeState(name: String) -> Bool {
        if validateStateTransition(currentState: currentState, nextState: name) {
            if currentState != nil && !currentState!.canAdvance(nextState: name) {
                if getDebugMode() { self.printErr(message: "> Invalid state transition: <\(currentState?.description ?? "nil")> is not complete and cannot advance to <\(name)>") }
            } else {
                if let currentState { currentState.cleanupState() }
                if states.contains(where: { $0.key.caseInsensitiveCompare(name) == .orderedSame }) {
                    if getDebugMode() { printTransition(message: "\(self.getName()) > CHANGING STATE from <\(currentState?.description ?? "nil")> to <\(name)>") }
                    var data: Any? = nil
                    if let currentState { data = currentState.getData() }
                    currentState = states[name]
                    currentState?.initState(data: data)
                    return true
                } else {
                    currentState = nil
                }
            }
        } else {
            if getDebugMode() { printErr(message: "\(self.getName()) > Invalid state transition: <\(currentState?.description ?? "nil")> to <\(name)>") }
        }
        return false
    }
    
    open func update(timeElapsed: Float) {
        if let currentState {
            currentState.updateState(timeElapsed: timeElapsed)
            if currentState.nextState() != nil {
                _ = self.changeState(name: currentState.nextState()!)
            }
        }
    }
    
    open func getDebugMode() -> Bool { return true }
    
    open func printLog(message: String) { print(message) }
    
    open func printTransition(message: String) { print(message) }
    
    open func printErr(message: String) { print(message) }
}
