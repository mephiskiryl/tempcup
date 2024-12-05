import Foundation

// Define the CustomAnimation protocol, which must conform to Hashable
public protocol CustomAnimation: Hashable {
    // Protocol requirements
    func startAnimation()
    func stopAnimation()
}

// Example struct that conforms to CustomAnimation
public struct FadeAnimation: CustomAnimation {
    // Properties
    let id: UUID
    let duration: TimeInterval
    
    // Hashable conformance
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: FadeAnimation, rhs: FadeAnimation) -> Bool {
        return lhs.id == rhs.id
    }
    
    // CustomAnimation protocol requirements
    public func startAnimation() {
        print("Starting fade animation with duration \(duration)")
    }
    
    public func stopAnimation() {
        print("Stopping fade animation")
    }
}

// Example class that conforms to CustomAnimation
public class SlideAnimation: CustomAnimation {
    // Properties
    let id: UUID
    let distance: Double
    
    // Initializer
    public init(id: UUID = UUID(), distance: Double) {
        self.id = id
        self.distance = distance
    }
    
    // Hashable conformance
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: SlideAnimation, rhs: SlideAnimation) -> Bool {
        return lhs.id == rhs.id
    }
    
    // CustomAnimation protocol requirements
    public func startAnimation() {
        print("Starting slide animation for distance \(distance)")
    }
    
    public func stopAnimation() {
        print("Stopping slide animation")
    }
}

// Usage examples
let fadeAnimation = FadeAnimation(id: UUID(), duration: 2.0)
fadeAnimation.startAnimation()
fadeAnimation.stopAnimation()

let slideAnimation = SlideAnimation(distance: 100.0)
slideAnimation.startAnimation()
slideAnimation.stopAnimation()

// Using them in a collection that requires Hashable conformance
let animations: Set<CustomAnimation> = [fadeAnimation, slideAnimation]
