//
//  ServiceConstants.swift
//  MyService
//
//  Created by Rahul Chopra on 01/11/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

struct ServiceConstants {
    
    
    struct MSAL {
        // Microsoft Authentication Api
        static let kBaseURL = "https://login.microsoftonline.com/common/oauth2/v2.0/token"
    }
    
    struct MSGraph {
        // Microsoft Graph Api
        static let kBaseURL = "https://graph.microsoft.com/v1.0"
    }
    
    struct FirebaseFunction {
        static let kBaseURL = "https://us-central1-interofficeapp.cloudfunctions.net"
    }
    
    
    //MARK:- REQUEST PARAMETERS
    struct RequestParameter {
        static let kGetToken = ""
        static let kGetUserInfo = "/me"
        static let kGetUserPhoto = "/me/photo/$value"
        static let kCustomFbToken = "/createFirebaseToken"
        static let kCalendar = "/me/calendar/events"
        static let kGroup = "/groups"
        static let kGroupItems = "/groups/\(groupId)/drive/root:/Guide:/children"
        static let kGroupFormItems = "/groups/\(groupId)/drive/root:/Form:/children"
        static let kAddActivity = "/addActivity"
        static let kGetActivity = "/getActivity"
        static let kGetStreamToken = "/generateToken"
        static let kDoComment = "/doComment"
        static let kGetComment = "/getComments"
    }
    
    //MARK:- SERVICE TYPE
    enum ServiceType {
        case kSTGetToken
        case kSTGetUserInfo
        case kSTGetUserPhoto
        case kSTCustomFbToken
        case kSTCalendar
        case kSTGroup
        case kSTGroupItems
        case kSTGroupFormItems
        case kSTDownloadGuideFile
        case kSTDownloadFormFile
        case kSTAddActivity
        case kSTGetActivity
        case kSTGetStreamToken
        case kSTDoComment
        case kSTGetComment
        case kSTGetActivityInChunks
    }
    
    // MARK:- REQUEST TYPE
    enum RequestType {
        case kRTGetToken
        case kRTGetUserInfo
        case kRTGetUserPhoto
        case kRTCustomFbToken
        case kRTCalendar
        case kRTGroup
        case kRTGroupItems
        case kRTGroupFormItems
        case kRTDownloadGuideFile
        case kRTDownloadFormFile
        case kRTAddActivity
        case kRTGetActivity
        case kRTGetStreamToken
        case kRTDoComment
        case kRTGetComment
        case kRTGetActivityInChunks
    }
    
    
}
