import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let workItem = DispatchWorkItem(qos: .utility, flags: .detached) {
    print("Performing WorkItem")
}
//workItem.perform()


let queue = DispatchQueue(label: "ru.Tony", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem, target: DispatchQueue.global(qos: .userInitiated))

queue.asyncAfter(deadline: .now() + 1, execute: workItem)

workItem.notify(queue: .main) {
    print("Workitem is completed")
}

workItem.isCancelled
workItem.cancel()
workItem.isCancelled

workItem.wait()
