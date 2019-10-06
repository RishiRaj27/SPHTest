//
//  MobileDataWorker.swift
//  SPHTest
//
//  Created by Rishi on 6/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

import UIKit

class PostDetailsWorker
{
    func fetchMobileData(completion: @escaping (MobileDataDetails.Data.Response?, Error?) -> ()) {
    guard let publicUrl = URL(string: APPURL.BaseURL + APPURL.UrlCollection.UserDetailUrl.UserPosts) else { return }
    URLSession.shared.dataTask(with: publicUrl) { (data, response
        , error) in
        guard let data = data else { return }
        do {
            let decoder = JSONDecoder()
            let publicData = try decoder.decode(MobileDataDetails.Data.Response.self, from: data)
            
            completion(publicData,nil)
        } catch let err {
            completion(nil,err)
        }
        }.resume()
  }
}
