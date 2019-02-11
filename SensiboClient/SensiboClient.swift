//
//  SensiboClient.swift
//  SensiboClient
//
//  Created by Colin Harris on 11/2/19.
//  Copyright © 2019 Colin Harris. All rights reserved.
//

import Foundation

public protocol Session {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: Session {

}

public class SensiboClient: NSObject {
    
    let baseUrl = URL(string: "https://home.sensibo.com")!
    let session: Session
    let apiKey: String
    
    public init(apiKey: String, session: Session = URLSession(configuration: .default)) {
        self.apiKey = apiKey
        self.session = session
    }
    
    public func getPods(callback: @escaping ([Pod]?, Error?) -> ()) {
        let url = URL(string: "/api/v2/users/me/pods?apiKey=\(self.apiKey)", relativeTo: baseUrl)!
        get(url: url) { (response: BaseResponse<[Pod]>?, error: Error?) in
            callback(response?.result, error)
        }
    }
    
    public func getPodState(podId: String, callback: @escaping (PodState?, Error?) -> ()) {
        let url = URL(string: "/api/v2/pods/\(podId)/acStates?limit=1&apiKey=\(self.apiKey)", relativeTo: baseUrl)!
        get(url: url) { (response: BaseResponse<[PodStateLog]>?, error: Error?) in
            callback(response?.result?[0].acState, error)
        }
    }
    
    public func setPodState(podId: String, podState: PodState, callback: @escaping (Bool, Error?) -> ()) {
        let url = URL(string: "/api/v2/pods/\(podId)/acStates?apiKey=\(self.apiKey)", relativeTo: baseUrl)!
        post(url: url, body: SetPodStateRequest(acState: podState)) { (response: BaseResponse<PodStateLog>?, error: Error?) in
            callback(response?.isSuccess ?? false, error)
        }
    }
    
    func get<T: Codable>(url: URL, callback: @escaping (T?, Error?) -> ()) {
        sendRequest(request: URLRequest(url: url), callback: callback)
    }
    
    func post<B: Codable, T: Codable>(url: URL, body: B, callback: @escaping (T?, Error?) -> ()) {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try! JSONEncoder().encode(body)
        urlRequest.allHTTPHeaderFields = [ "Content-Type": "application/json" ]
        sendRequest(request: urlRequest, callback: callback)
    }
    
    func sendRequest<T: Codable>(request: URLRequest, callback: @escaping (T?, Error?) -> ()) {
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                callback(nil, error)
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let getPodsResponse = try? JSONDecoder().decode(T.self, from: data) {
                    callback(getPodsResponse, nil)
            } else {
                callback(nil, SensiboError.requestFailed)
            }
        }
        dataTask.resume()
    }
}

enum SensiboError: Error {
    case requestFailed
    case requestError(message: String)
}
