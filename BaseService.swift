//
//  BaseService.swift
//  InterOfficeApp
//
//  Created by Rahul Chopra on 01/11/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import Foundation
import Alamofire

protocol GetResponseDataProtocol {
    func didGetResponseFromServerWithObject(responseObject: Response)
}

class BaseService: NSObject {
    
    // MARK:- GET METHOD
    func sendGetRequestWithObj(urlString: String, obj: Dictionary<String,Any>?, httpHeader: Dictionary<String,String>?, serviceURL: String, serviceType: ServiceConstants.ServiceType, requestType: ServiceConstants.RequestType, delegate: GetResponseDataProtocol) {
        let stringURL = urlString + serviceURL
        let param = obj
        print(stringURL)
        
        Alamofire.request(stringURL, method: .get, parameters: param, encoding: URLEncoding.default, headers: httpHeader).responseJSON { (response) in
            switch response.result {
            case .success :
                if let json = response.result.value {
                    self.serviceResult(responseObject: json, success: true, serviceType: serviceType, delegate: delegate)
                }
            case .failure :
                self.serviceResult(responseObject: nil, success: false, serviceType: serviceType, delegate: delegate)
            }
        }
      
    }
    
    // MARK:- GET METHOD WITH RESPONSE DATA (for getting user image in binary form)
    func sendGetRequestForGettingUserPhotoWithObj(urlString: String, obj: Dictionary<String,String>?, httpHeader: Dictionary<String,String>?, serviceURL: String, serviceType: ServiceConstants.ServiceType, requestType: ServiceConstants.RequestType, delegate: GetResponseDataProtocol) {
        let stringURL = urlString + serviceURL
        let param = obj
        print(stringURL)
        
        Alamofire.request(stringURL, method: .get, parameters: param, encoding: URLEncoding.default, headers: httpHeader).responseData { (responseData) in
            switch responseData.result {
            case .success :
                if let data = responseData.result.value {
                    let userImage = UIImage(data: data)
                    self.serviceResult(responseObject: ["userPhoto" : userImage], success: true, serviceType: serviceType, delegate: delegate)
                }
            case .failure :
                self.serviceResult(responseObject: nil, success: false, serviceType: serviceType, delegate: delegate)
            }
        }
    }
    
    // MARK:- POST METHOD
    func sendPostRequestWithObj(urlString: String, obj: Dictionary<String,Any>, header: Dictionary<String,String>?, serviceURL: String, serviceType: ServiceConstants.ServiceType, requestType: ServiceConstants.RequestType, delegate: GetResponseDataProtocol) {
        let stringURL = urlString + serviceURL
        let param: Parameters = obj
        print(stringURL)
        
        Alamofire.request(stringURL, method: .post, parameters: param, encoding: URLEncoding.httpBody, headers: header).responseJSON { (response) in
            
            switch response.result {
            case .success :
                if let json = response.result.value {
                    self.serviceResult(responseObject: json, success: true, serviceType: serviceType, delegate: delegate)
                }
            case .failure :
                self.serviceResult(responseObject: nil, success: false, serviceType: serviceType, delegate: delegate)
            }
        }
    }
    
    // MARK:- DOWNLOAD FILES
    func downloadFileWithObj(fileURL: String, fileName: String, serviceType: ServiceConstants.ServiceType, delegate: GetResponseDataProtocol) {
        
        // Getting document directory path and pass it to alamofire download function to write the file that path
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            documentsURL?.appendPathComponent(fileName)
            return (documentsURL!, [.removePreviousFile])
        }
        
        Alamofire.download(fileURL, to: destination).responseData { (response) in
            switch response.result {
            case .success :
                if let destinationUrl = response.destinationURL {
                    //print("destinationUrl \(destinationUrl.absoluteURL)")
                    self.serviceResult(responseObject: ["filePath" : destinationUrl.absoluteURL], success: true, serviceType: serviceType, delegate: delegate)
                }
                
            case .failure:
                self.serviceResult(responseObject: nil, success: false, serviceType: serviceType, delegate: delegate)
            }
        }
    }
    
    func serviceResult(responseObject: Any?, success: Bool, serviceType: ServiceConstants.ServiceType, delegate: GetResponseDataProtocol) {
        if success {
            print("API Success")
        }
        else {
            print("API Failed")
        }
    }
    
    func getResponseWithSucess(responseObject: Any?, success: Bool, serviceType: ServiceConstants.ServiceType, delegate: GetResponseDataProtocol) -> Response {
        let response = Response()
        response.dataObject = responseObject as? Dictionary
        response.success = success
        response.serviceType = serviceType
        return response
    }
    
}
