import Cocoa
import SensiboClient

let client = SensiboClient(apiKey: "...")
client.getPods() { (pods, error) in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    }
    if let pods = pods {
        for pod in pods {
            print("Pod: \(pod.id)")
        }
        
        let loungePod = pods[1]
        client.getPodState(podId: loungePod.id) { (podState, error) in
            if let podState = podState {
                print("Pod State:")
                print(" on: \(podState.on)")
                podState.on = !podState.on
                
                client.setPodState(podId: loungePod.id, podState: podState) { (success, error) in
                    print("Updated: \(success)")
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            } else {
                print("Error: \(error?.localizedDescription ?? "none")")
            }
        }
    }
}
