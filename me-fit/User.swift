//
//  User.swift
//  me-fit
//
//  Created by Jason Ngo on 2016-11-01.
//  Copyright © 2016 Jason Ngo. All rights reserved.
//

import Foundation

class User {
    private var _firstName: String!
    private var _lastName: String!
    private var _email: String! // Username
    
    init() {
        //
    }
    
    var email: String {
        return _email
    }
}
