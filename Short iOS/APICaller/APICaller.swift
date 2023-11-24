//
//  APICaller.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/24.
//

import UIKit

struct URLLink {
    let urlLink = "http://119.202.103.118:8080/"
}
// http://119.202.103.118:8080/post get
final class APIcaller{
    
    static let shared = APIcaller()
    private let urlLink = URLLink()
    
    // MARK: - GETUSerData user를 읽어오는 것
    func getUserData(completion : @escaping (Result<[GetUserData], Error>) ->Void )  {
        guard let url = URL(string: "\(urlLink.urlLink)post") else {
            print("여기서 에러가 발생합니다.")
            completion(.failure(URLError.invalidURL))
            return
        }
       let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response , error in
            guard let  data = data, error == nil else {
                completion(.failure(URLError.invalidURL))
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do{
                    let userResponse = try JSONDecoder().decode(User.self, from: data)
                    completion(.success(userResponse.data))
                    let resultsconsle = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                }catch let err {
                    completion(.failure(err))
                }
            } else{
                completion(.failure(URLError.invalidURL))
            }
        }
        task.resume()
    }
    //MARK: - GetLetterData
    func getLetterData(completion : @escaping (Result<[GetLetterData], Error>) ->Void )  {
        guard let url = URL(string: "\(urlLink.urlLink)post") else {
            print("여기서 에러가 발생합니다.")
            completion(.failure(URLError.invalidURL))
            return
        }
       let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response , error in
            guard let  data = data, error == nil else {
                completion(.failure(URLError.invalidURL))
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do{
                    let letterResponse = try JSONDecoder().decode(LetterData.self, from: data)
                    completion(.success(letterResponse.data))
                    let resultsconsle = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                }catch let err {
                    completion(.failure(err))
                }
            } else{
                completion(.failure(URLError.invalidURL))
            }
        }
        task.resume()
    }
    
    
   

    // MARK: - Create _ 데이터를 서버에 추가하는 함수
    func makePostRequestLetter(with nickname : String, roomCode: String, title: Int, sender: String , content  : String , imagePath  : String) {
        guard let url = URL(string: "http://3.35.236.83/pard/join") else {
            print("🚨 Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body:[String: AnyHashable] = [
            "authorNickname" : nickname,
            "roomCode" : roomCode,
            "title" : title,
            "sender" : sender,
            "content" : content,
            "imagePath" : imagePath
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print("🚨 Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let _ = try JSONSerialization.jsonObject(with: data, options: .allowFragments)//responds
            } catch {
                print("🚨 ", error)
            }
        }
        task.resume()
    }
    // MARK: - Create _ 데이터를 서버에 추가하는 함수
    func makePostRequestUser(with imgUrl: String, name: String, age: Int, part: String ) {
        guard let url = URL(string: "http://3.35.236.83/pard/join") else {
            print("🚨 Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body:[String: AnyHashable] = [
            "name": name,
            "age": age,
            "part": part,
            "imgURL": imgUrl
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print("🚨 Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let _ = try JSONSerialization.jsonObject(with: data, options: .allowFragments)//responds
            } catch {
                print("🚨 ", error)
            }
        }
        task.resume()
    }
}

/**
 
 
 struct GetLetterData : Codable{
     let authorNickname : String
     let roomCode : String
     let title : String
     let sender  : String
     let content  : String
     let imagePath  : String
 }
 */
