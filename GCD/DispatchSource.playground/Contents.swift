import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let queue = DispatchQueue(label: "Tony", attributes: .concurrent)

let timer = DispatchSource.makeTimerSource (queue: queue)
timer.schedule(deadline: .now(), repeating: .seconds(2), leeway: .microseconds(300))
timer.setEventHandler {
    print("Hello, World!")
}

timer.setCancelHandler {
    print("Timer is canceld")
}

timer.resume()  

