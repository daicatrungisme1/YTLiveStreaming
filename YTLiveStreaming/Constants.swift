//
//  Constants.swift
//  YouTubeLiveVideo
//
//  Created by Sergey Krotkih on 10/28/16.
//  Copyright © 2016 Sergey Krotkih. All rights reserved.
//

import UIKit

struct Auth {
   static let ClientSecret = ""
   static let BaseURL = "https://www.googleapis.com/youtube/v3"
   static let AuthorizeURL = "https://accounts.google.com/o/oauth2/auth"
   static let TokenURL = "https://www.googleapis.com/oauth2/v3/token"
   static let RedirectURL = "http://localhost"
   static let Scope = "https://www.googleapis.com/auth/youtube%20https://www.googleapis.com/auth/plus.profile.emails.read"
}

struct LiveAPI {
   static let Resolution = "720p"    // 1080p 1440p 240p 360p 480p 720p
   static let FrameRate = "60fps"    // 30fps
   static let IngestionType = "rtmp" // dash rtmp
   
}
