//
//  MyService.swift
//  InterOfficeApp
//
//  Created by Rahul Chopra on 01/11/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import Foundation

class HRService: BaseService {
    
    private static let shared = HRService()
    
    static func sharedInstance() -> HRService {
        return shared
    }
    
    private override init() { }
    
    
    func sendGetRequestToGetUserDetails(dict: Dictionary<String, String>?, httpHeader: Dictionary<String, String>, delegate: GetResponseDataProtocol) {
        super.sendGetRequestWithObj(urlString: ServiceConstants.MSGraph.kBaseURL, obj: dict, httpHeader: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGetUserInfo, serviceType: ServiceConstants.ServiceType.kSTGetUserInfo, requestType: ServiceConstants.RequestType.kRTGetUserInfo, delegate: delegate)
    }
    
    func sendGetRequestToGetUserPhoto(dict: Dictionary<String, String>?, httpHeader: Dictionary<String, String>, delegate: GetResponseDataProtocol) {
        super.sendGetRequestForGettingUserPhotoWithObj(urlString: ServiceConstants.MSGraph.kBaseURL, obj: dict, httpHeader: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGetUserPhoto, serviceType: ServiceConstants.ServiceType.kSTGetUserPhoto, requestType: ServiceConstants.RequestType.kRTGetUserPhoto, delegate: delegate)
    }
    
    func sendPostRequestToGetToken(dict: Dictionary<String, String>, httpHeader: Dictionary<String, String>?, delegate: GetResponseDataProtocol) {
        super.sendPostRequestWithObj(urlString: ServiceConstants.MSAL.kBaseURL, obj: dict, header: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGetToken, serviceType: ServiceConstants.ServiceType.kSTGetToken, requestType: ServiceConstants.RequestType.kRTGetToken, delegate: delegate)
    }
    
    func sendPostRequestToGetCustomFirebaseToken(dict: Dictionary<String, String>, httpHeader: Dictionary<String, String>?, delegate: GetResponseDataProtocol) {
        super.sendPostRequestWithObj(urlString: ServiceConstants.FirebaseFunction.kBaseURL, obj: dict, header: httpHeader, serviceURL: ServiceConstants.RequestParameter.kCustomFbToken, serviceType: ServiceConstants.ServiceType.kSTCustomFbToken, requestType: ServiceConstants.RequestType.kRTCustomFbToken, delegate: delegate)
    }
    
    func sendGetRequestToGetUserCalendar(filterEndpoint: String, dict: Dictionary<String, String>?, httpHeader: Dictionary<String, String>, delegate: GetResponseDataProtocol) {
        super.sendGetRequestWithObj(urlString: ServiceConstants.MSGraph.kBaseURL, obj: dict, httpHeader: httpHeader, serviceURL: ServiceConstants.RequestParameter.kCalendar + filterEndpoint, serviceType: ServiceConstants.ServiceType.kSTCalendar, requestType: ServiceConstants.RequestType.kRTCalendar, delegate: delegate)
    }
    
    func sendGetRequestToGetUserGroups(dict: Dictionary<String, String>?, httpHeader: Dictionary<String, String>, delegate: GetResponseDataProtocol) {
        super.sendGetRequestWithObj(urlString: ServiceConstants.MSGraph.kBaseURL, obj: dict, httpHeader: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGroup, serviceType: ServiceConstants.ServiceType.kSTGroup, requestType: ServiceConstants.RequestType.kRTGroup, delegate: delegate)
    }
    
    func sendGetRequestToGetUserGroupItems(dict: Dictionary<String, String>?, httpHeader: Dictionary<String, String>, delegate: GetResponseDataProtocol) {
        super.sendGetRequestWithObj(urlString: ServiceConstants.MSGraph.kBaseURL, obj: dict, httpHeader: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGroupItems, serviceType: ServiceConstants.ServiceType.kSTGroupItems, requestType: ServiceConstants.RequestType.kRTGroupItems, delegate: delegate)
    }
    
    func sendGetRequestToGetUserGroupFormItems(dict: Dictionary<String, String>?, httpHeader: Dictionary<String, String>, delegate: GetResponseDataProtocol) {
        super.sendGetRequestWithObj(urlString: ServiceConstants.MSGraph.kBaseURL, obj: dict, httpHeader: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGroupFormItems, serviceType: ServiceConstants.ServiceType.kSTGroupFormItems, requestType: ServiceConstants.RequestType.kRTGroupFormItems, delegate: delegate)
    }
    
    func downloadFilesFromGuideFolder(downloadURL: String, fileName: String, delegate: GetResponseDataProtocol) {
        super.downloadFileWithObj(fileURL: downloadURL, fileName: fileName, serviceType: ServiceConstants.ServiceType.kSTDownloadGuideFile, delegate: delegate)
    }
    
    func downloadFilesFromFormFolder(downloadURL: String, fileName: String, delegate: GetResponseDataProtocol) {
        super.downloadFileWithObj(fileURL: downloadURL, fileName: fileName, serviceType: ServiceConstants.ServiceType.kSTDownloadFormFile, delegate: delegate)
    }
    
    func sendPostRequestToAddActivityOnGetStream(dict: Dictionary<String, String>, httpHeader: Dictionary<String, String>?, delegate: GetResponseDataProtocol) {
        super.sendPostRequestWithObj(urlString: ServiceConstants.FirebaseFunction.kBaseURL, obj: dict, header: httpHeader, serviceURL: ServiceConstants.RequestParameter.kAddActivity, serviceType: ServiceConstants.ServiceType.kSTAddActivity, requestType: ServiceConstants.RequestType.kRTAddActivity, delegate: delegate)
    }
    
    func sendPostRequestToGetActivityFromGetStream(dict: Dictionary<String, Any>, httpHeader: Dictionary<String, String>?, delegate: GetResponseDataProtocol) {
        super.sendPostRequestWithObj(urlString: ServiceConstants.FirebaseFunction.kBaseURL, obj: dict, header: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGetActivity, serviceType: ServiceConstants.ServiceType.kSTGetActivity, requestType: ServiceConstants.RequestType.kRTGetActivity, delegate: delegate)
    }
    
    func sendPostRequestToGetActivityInChunksFromGetStream(dict: Dictionary<String, Any>, httpHeader: Dictionary<String, String>?, delegate: GetResponseDataProtocol) {
        super.sendPostRequestWithObj(urlString: ServiceConstants.FirebaseFunction.kBaseURL, obj: dict, header: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGetActivity, serviceType: ServiceConstants.ServiceType.kSTGetActivityInChunks, requestType: ServiceConstants.RequestType.kRTGetActivityInChunks, delegate: delegate)
    }
    
    func sendPostRequestToGetStreamToken(dict: Dictionary<String, Any>, httpHeader: Dictionary<String, String>?, delegate: GetResponseDataProtocol) {
        super.sendPostRequestWithObj(urlString: ServiceConstants.FirebaseFunction.kBaseURL, obj: dict, header: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGetStreamToken, serviceType: ServiceConstants.ServiceType.kSTGetStreamToken, requestType: ServiceConstants.RequestType.kRTGetStreamToken, delegate: delegate)
    }
    
    func sendPostRequestToWriteComment(dict: Dictionary<String, Any>, httpHeader: Dictionary<String, String>?, delegate: GetResponseDataProtocol) {
        super.sendPostRequestWithObj(urlString: ServiceConstants.FirebaseFunction.kBaseURL, obj: dict, header: httpHeader, serviceURL: ServiceConstants.RequestParameter.kDoComment, serviceType: ServiceConstants.ServiceType.kSTDoComment, requestType: ServiceConstants.RequestType.kRTDoComment, delegate: delegate)
    }
    
    func sendPostRequestToGetComment(dict: Dictionary<String, Any>, httpHeader: Dictionary<String, String>?, delegate: GetResponseDataProtocol) {
        super.sendPostRequestWithObj(urlString: ServiceConstants.FirebaseFunction.kBaseURL, obj: dict, header: httpHeader, serviceURL: ServiceConstants.RequestParameter.kGetComment, serviceType: ServiceConstants.ServiceType.kSTGetComment, requestType: ServiceConstants.RequestType.kRTGetComment, delegate: delegate)
    }
    
    
    override func serviceResult(responseObject: Any?, success: Bool, serviceType: ServiceConstants.ServiceType, delegate: GetResponseDataProtocol) {
        super.serviceResult(responseObject: responseObject, success: success, serviceType: serviceType, delegate: delegate)
        
        let response = super.getResponseWithSucess(responseObject: responseObject, success: success, serviceType: serviceType, delegate: delegate)
        
        delegate.didGetResponseFromServerWithObject(responseObject: response)
    }
    
}
