import Cocoa
import SensiboClient

let client = SensiboClient(apiKey: "qGGXa1bCoGrG8Tn35nVYo4i5bgsbez")
client.getPods() { (pods, error) in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    }
    if let pods = pods {
        for pod in pods {
            print("Pod: \(pod.id)")
        }
    }
}
