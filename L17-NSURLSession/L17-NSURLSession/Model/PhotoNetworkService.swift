//
//  PhotoNetworkService.swift
//  L17-NSURLSession
//
//  Created by Антон Сафронов on 06.06.2021.
//

import Foundation

final class PhotoNetworkService {

    private let session: URLSession = .shared
    private let decoder = JSONDecoder()
//    private let decoder: JSONDecoder = {
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        return decoder
//    }()

    deinit {
        print("PhotoNetworkService deinit")
    }
}

extension PhotoNetworkService: PhotoNetworkServiceProtocol {

    func getData(with completion: @escaping (GetPhotosAPIResponse) -> Void) {
        let components = URLComponents(string: Constants.urlString)
        guard let url = components?.url else {
            completion(.failure(.unknown))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(Constants.accessKey, forHTTPHeaderField: "Authorization")
        
        session.dataTask(with: request) { (data, response, taskError) in
            do {
                let data = try self.httpResponse(data: data, response: response)
                let response = try self.decoder.decode(GetPhotosResponse.self, from: data)
                completion(.success(response))
            } catch let error as NetworkServiceError {
                completion(.failure(error))
            } catch { completion(.failure(.decodable)) }
        }
        .resume()
    }
    
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: imageUrl) else { completion(nil)
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        
        session.dataTask(with: request) { (data, response, taskError) in
            do {
                let data = try self.httpResponse(data: data, response: response)
                completion(data)
            } catch {
                completion(nil)
            }
        }
        .resume()
    }
    
    private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode),
              let data = data else {
            throw NetworkServiceError.network
        }
        return data
    }
}
    
    
    
    
    
    
    

