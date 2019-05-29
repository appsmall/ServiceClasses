//
//  Activity.swift
//  MyService
//
//  Created by Rahul Chopra on 22/11/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

class Activity {
    init(){
        print("Activity Object is created")
    }
    
    static func destroy(){
        print("Activity Object Destroyed")
    }
    
    private var _id: String?                // Activity Id
    private var _fbUserId: String?          // Firebase User Id
    private var _type: GetStreamConstant.type?              // type is either image type or text type
    private var _actor: String?             // user name
    private var _activityText: String?      // news feed text
    private var _activityImage: String?  // event image url (image saved in firebase)
    private var _foreignId: String?
    private var _object: Int64?
    private var _time: String?
    private var _target: String?
    private var _verb: String?
    private var _timestamp : Int64?
    
    
    
    var id: String{
        set{
            _id = newValue
        }
        get{
            if _id == nil{
                _id = emptyString
            }
            return _id!
        }
    }
    
    var fbUserId: String{
        set{
            _fbUserId = newValue
        }
        get{
            if _fbUserId == nil{
                _fbUserId = emptyString
            }
            return _fbUserId!
        }
    }
    
    var type: GetStreamConstant.type{
        set{
            _type = newValue
        }
        get{
            if _type == nil{
                _type = GetStreamConstant.type.text
            }
            return _type!
        }
    }
    
    var actor: String{
        set{
            _actor = newValue
        }
        get{
            if _actor == nil{
                _actor = emptyString
            }
            return _actor!
        }
    }
    
    var activityText: String{
        set{
            _activityText = newValue
        }
        get{
            if _activityText == nil{
                _activityText = emptyString
            }
            return _activityText!
        }
    }
    
    var activityImage: String{
        set{
            _activityImage = newValue
        }
        get{
            if _activityImage == nil{
                _activityImage = emptyString
            }
            return _activityImage!
        }
    }
    
    var time: String{
        set{
            _time = newValue
        }
        get{
            if _time == nil{
                _time = emptyString
            }
            return _time!
        }
    }
    
    var verb: String{
        set{
            _verb = newValue
        }
        get{
            if _verb == nil{
                _verb = emptyString
            }
            return _verb!
        }
    }
    
    var timestamp : Int64{
        set{
            _timestamp = newValue
        }
        get{
            if _timestamp == nil{
                _timestamp = 0
                
            }
            return _timestamp!
        }
    }
    
    var foreignId: String{
        set{
            _foreignId = newValue
        }
        get{
            if _foreignId == nil{
                _foreignId = emptyString
            }
            return _foreignId!
        }
    }
    
    var object: Int64{
        set{
            _object = newValue
        }
        get{
            if _object == nil{
                _object = 0
            }
            return _object!
        }
    }
    
    var target: String{
        set{
            _target = newValue
        }
        get{
            if _target == nil{
                _target = emptyString
            }
            return _target!
        }
    }
}
