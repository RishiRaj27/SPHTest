//
//  MobileDataModels.swift
//  SPHTest
//
//  Created by Rishi on 6/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

import Foundation

enum MobileDataDetails
{
  // MARK: Use cases
  
  enum Data
  {
    struct Request
    {
        
    }
    
    struct Response:Codable
    {
        var success:Bool?
        var result:Result?
        var help:String?
        
        enum CodingKeys: String, CodingKey {
            case help = "help"
            case success = "success"
            case result = "result"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            help = try values.decodeIfPresent(String.self, forKey: .help)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            result = try values.decodeIfPresent(Result.self, forKey: .result)
        }
    }
    
    struct Result : Codable {
        var resource_id:String?
        var fields:[Fields]?
        var records:[Records]?
        var _links:Links?
        var limit:Int?
        var total:Int?
        
        enum CodingKeys: String, CodingKey {
            case resource_id = "resource_id"
            case fields = "fields"
            case records = "records"
            case _links = "_links"
            case limit = "limit"
            case total = "total"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            resource_id = try values.decodeIfPresent(String.self, forKey: .resource_id)
            fields = try values.decodeIfPresent([Fields].self, forKey: .fields)
            records = try values.decodeIfPresent([Records].self, forKey: .records)
            _links = try values.decodeIfPresent(Links.self, forKey: ._links)
            limit = try values.decodeIfPresent(Int.self, forKey: .limit)
            total = try values.decodeIfPresent(Int.self, forKey: .total)
        }

    }
    
    struct Fields:Codable
    {
        var type:String?
        var id:String?
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case id = "id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            id = try values.decodeIfPresent(String.self, forKey: .id)
        }
    }
    
    struct Records:Codable
    {
        var volume_of_mobile_data:String?
        var quarter:String?
        var _id:Int?

        enum CodingKeys: String, CodingKey {
            case volume_of_mobile_data = "volume_of_mobile_data"
            case quarter = "quarter"
            case _id = "_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            volume_of_mobile_data = try values.decodeIfPresent(String.self, forKey: .volume_of_mobile_data)
            quarter = try values.decodeIfPresent(String.self, forKey: .quarter)
            _id = try values.decodeIfPresent(Int.self, forKey: ._id)
        }

    }
    struct Links:Codable
    {
        var start:String?
        var next:String?
        
        enum CodingKeys: String, CodingKey {
            case start = "start"
            case next = "next"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            start = try values.decodeIfPresent(String.self, forKey: .start)
            next = try values.decodeIfPresent(String.self, forKey: .next)
        }
    }
  }
}
